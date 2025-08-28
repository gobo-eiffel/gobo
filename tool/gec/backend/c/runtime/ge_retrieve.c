/*
	description:

		"C functions used to implement Storable facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_RETRIEVE_C
#define GE_RETRIEVE_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_RETRIEVE_H
#include "ge_retrieve.h"
#endif
#ifndef GE_STORABLE_H
#include "ge_storable.h"
#endif
#ifndef GE_GC_H
#include "ge_gc.h"
#endif
#ifndef GE_TYPES_H
#include "ge_types.h"
#endif

#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

#if defined(GE_USE_ATTRIBUTES) && defined(GE_USE_ATTRIBUTE_NAME) && defined(GE_USE_ATTRIBUTE_TYPE_ID) && defined(GE_USE_ATTRIBUTE_DYNAMIC_TYPE_SET) && defined(GE_USE_ATTRIBUTE_OFFSET)

/* Convert a big endian INTEGER_16 to host byte order. */
static EIF_INTEGER_16 GE_integer_16_from_be(EIF_INTEGER_16 be)
{
#if BYTEORDER == 0x1234
		/* Convert big endian to little endian. */
	return ((be >> 8) & 0xFF) |
			((be << 8) & 0xFF00);
#else
	return be;
#endif
}

/* Convert a big endian INTEGER_32 to host byte order. */
static EIF_INTEGER_32 GE_integer_32_from_be(EIF_INTEGER_32 be)
{
#if BYTEORDER == 0x1234
		/* Convert big endian to little endian. */
	return ((be >> 24) & 0xFF) |
			((be >> 8) & 0xFF00) |
			((be << 8) & 0xFF0000) |
			((be << 24) & 0xFF000000);
#else
	return be;
#endif
}

/* Convert a little endian real64 to host byte order. */
static EIF_REAL_64 GE_real_64_from_le(EIF_REAL_64 le)
{
#if BYTEORDER == 0x4321
		/* Convert little endian to big endian. */
	EIF_REAL_64 be;
	char* l_le_buffer;
	char* l_be_buffer;
	int i;

	l_le_buffer = (char*)(&le);
	l_be_buffer = (char*)(&be);
	for (i = 0; i < 8; i++) {
		l_be_buffer[7 - i] = l_le_buffer[i];
	}
	return be;
#else
	return le;
#endif
}

/* Size of the buffer to retrieve Storable objects (256 kB). */
#define GE_STORABLE_IN_BUFFER_SIZE 262144L

/* Struct for Storable read buffer. */
typedef struct GE_storable_in_buffer_struct GE_storable_in_buffer;
struct GE_storable_in_buffer_struct {
	uint32_t position; /* Current position in buffer. */
	uint32_t count; /* Number of bytes in buffer. */
	uint32_t capacity; /* Maximum number of bytes in buffer. */
	char* bytes; /* Bytes in buffer. */
	int (*read_char)(GE_storable_in_buffer*, char *, int); /* Function to fill in the buffer. */
};

/* Struct for Storable read buffer with file descriptor. */
typedef struct {
	uint32_t position; /* Current position in buffer. */
	uint32_t count; /* Number of bytes in buffer. */
	uint32_t capacity; /* Maximum number of bytes in buffer. */
	char* bytes; /* Bytes in buffer. */
	int (*read_char)(GE_storable_in_buffer*, char *, int); /* Function to fill in the buffer. */
	int file_desc;
} GE_storable_in_buffer_from_file;

/*
 * Read `a_size' characters from the file attached to `a_buffer'.
 * and make them available in `a_pointer'.
 * Return the number of characters actually read.
 */
static int GE_storable_read(GE_storable_in_buffer* a_buffer, char* a_pointer, int a_size)
{
	return read(((GE_storable_in_buffer_from_file*)a_buffer)->file_desc, a_pointer, a_size);
}

/*
 * Create a new buffer to read Stored objects.
 */
static GE_storable_in_buffer* GE_storable_in_new_buffer(int (*read_char)(GE_storable_in_buffer*, char *, int))
{
	GE_storable_in_buffer* buffer;

	buffer = (GE_storable_in_buffer*)GE_malloc(sizeof(GE_storable_in_buffer));
	buffer->position = 0;
	buffer->count = 0;
	buffer->capacity = GE_STORABLE_IN_BUFFER_SIZE;
	buffer->bytes = (char*)GE_malloc_atomic(buffer->capacity);
	buffer->read_char = read_char;
	return buffer;
}

/*
 * Create a new buffer to read Storable files.
 */
static GE_storable_in_buffer* GE_storable_in_new_buffer_from_file(int (*read_char)(GE_storable_in_buffer*, char *, int), int a_file_desc)
{
	GE_storable_in_buffer_from_file* buffer;

	buffer = (GE_storable_in_buffer_from_file*)GE_malloc(sizeof(GE_storable_in_buffer_from_file));
	buffer->position = 0;
	buffer->count = 0;
	buffer->capacity = GE_STORABLE_IN_BUFFER_SIZE;
	buffer->bytes = (char*)GE_malloc_atomic(buffer->capacity);
	buffer->read_char = read_char;
	buffer->file_desc = a_file_desc;
	return (GE_storable_in_buffer*)buffer;
}

/*
 * Fill `a_buffer'.
 */
static void GE_storable_in_fill_buffer(GE_storable_in_buffer* a_buffer)
{
	int32_t l_size;
	int l_bytes_read;
	long l_amount_left;
	register int l_part_read;
	register int l_total_read = 0;
	register char* l_ptr = a_buffer->bytes;

	l_bytes_read = a_buffer->read_char(a_buffer, (char*)(&l_size), sizeof(int32_t));
	if ((l_bytes_read < 0) || ((size_t)l_bytes_read < sizeof(int32_t))) {
		GE_raise_with_message(GE_EX_RETR, "Independent retrieve: unable to read buffer size");
	}

	l_size = GE_integer_32_from_be(l_size);
	l_amount_left = l_size;
	while (l_total_read < l_size) {
		if ((l_part_read = a_buffer->read_char(a_buffer, l_ptr, l_amount_left)) <= 0) {
				/* If we read 0 byte, it means that we reached the end of file. */
			GE_raise_with_message(GE_EX_RETR, "Independent retrieve: unable to read bytes from buffer");
		}
		l_total_read += l_part_read;
		l_ptr += l_part_read;
		l_amount_left -= l_part_read;
	}
	a_buffer->position = 0;
	a_buffer->count = l_total_read;
}

/*
 * Refill `a_buffer' if necessary.
 */
static void GE_storable_in_check_buffer_capacity(GE_storable_in_buffer* a_buffer, size_t a_size)
{
	if ((a_buffer->position + a_size) > a_buffer->count) {
		GE_storable_in_fill_buffer(a_buffer);
	}
}

/*
 * Read `a_num' CHARACTER_8 values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_character_8(GE_storable_in_buffer* a_buffer, EIF_CHARACTER_8* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_CHARACTER_8 l_value;

	while (a_num > i++) {
		GE_storable_in_check_buffer_capacity(a_buffer, sizeof(EIF_CHARACTER_8));
		memcpy(&l_value, a_buffer->bytes + a_buffer->position, sizeof(EIF_CHARACTER_8));
		*a_object++ = l_value;
		a_buffer->position += sizeof(EIF_CHARACTER_8);
	}
}

/*
 * Read `a_num' BOOLEAN values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_boolean(GE_storable_in_buffer* a_buffer, EIF_BOOLEAN* a_object, size_t a_num)
{
	size_t i = 0;
	char l_value;

	/* Note: BOOLEANs as stored as chars. */
	while (a_num > i++) {
		GE_storable_in_check_buffer_capacity(a_buffer, sizeof(char));
		memcpy(&l_value, a_buffer->bytes + a_buffer->position, sizeof(char));
		*a_object++ = EIF_TEST(l_value);
		a_buffer->position += sizeof(char);
	}
}

/*
 * Read `a_num' INTEGER_8 values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_integer_8(GE_storable_in_buffer* a_buffer, EIF_INTEGER_8* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_INTEGER_8 l_value;

	while (a_num > i++) {
		GE_storable_in_check_buffer_capacity(a_buffer, sizeof(EIF_INTEGER_8));
		memcpy(&l_value, a_buffer->bytes + a_buffer->position, sizeof(EIF_INTEGER_8));
		*a_object++ = l_value;
		a_buffer->position += sizeof(EIF_INTEGER_8);
	}
}

/*
 * Read `a_num' NATURAL_8 values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_natural_8(GE_storable_in_buffer* a_buffer, EIF_NATURAL_8* a_object, size_t a_num)
{
	GE_storable_in_read_integer_8(a_buffer, (EIF_INTEGER_8*)a_object, a_num);
}

/*
 * Read `a_num' INTEGER_16 values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_integer_16(GE_storable_in_buffer* a_buffer, EIF_INTEGER_16* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_INTEGER_16 l_value;

	while (a_num > i++) {
		GE_storable_in_check_buffer_capacity(a_buffer, sizeof(EIF_INTEGER_16));
		memcpy(&l_value, a_buffer->bytes + a_buffer->position, sizeof(EIF_INTEGER_16));
		*a_object++ = (EIF_INTEGER_16)GE_integer_16_from_be(l_value);
		a_buffer->position += sizeof(EIF_INTEGER_16);
	}
}

/*
 * Read `a_num' NATURAL_16 values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_natural_16(GE_storable_in_buffer* a_buffer, EIF_NATURAL_16* a_object, size_t a_num)
{
	GE_storable_in_read_integer_16(a_buffer, (EIF_INTEGER_16*)a_object, a_num);
}

/*
 * Read `a_num' INTEGER_32 values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_integer_32(GE_storable_in_buffer* a_buffer, EIF_INTEGER_32* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_INTEGER_32 l_value;

	while (a_num > i++) {
		GE_storable_in_check_buffer_capacity(a_buffer, sizeof(EIF_INTEGER_32));
		memcpy(&l_value, a_buffer->bytes + a_buffer->position, sizeof(EIF_INTEGER_32));
		*a_object++ = (EIF_INTEGER_32)GE_integer_32_from_be(l_value);
		a_buffer->position += sizeof(EIF_INTEGER_32);
	}
}

/*
 * Read `a_num' NATURAL_32 values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_natural_32(GE_storable_in_buffer* a_buffer, EIF_NATURAL_32* a_object, size_t a_num)
{
	GE_storable_in_read_integer_32(a_buffer, (EIF_INTEGER_32*)a_object, a_num);
}

/*
 * Read `a_num' INTEGER_64 values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_integer_64(GE_storable_in_buffer* a_buffer, EIF_INTEGER_64* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_INTEGER_64 l_lower, l_upper;
	EIF_INTEGER_32 l_value;

	while (a_num > i++) {
		GE_storable_in_check_buffer_capacity(a_buffer, sizeof(EIF_INTEGER_64));
		/* Note: INTEGER_64s are stored as two INTEGER_32s,
		   first the lower part and then the upper part. */
		memcpy(&l_value, a_buffer->bytes + a_buffer->position, sizeof(EIF_INTEGER_32));
		l_lower = (EIF_INTEGER_64)GE_integer_32_from_be(l_value);
		memcpy(&l_value, a_buffer->bytes + a_buffer->position + sizeof(EIF_INTEGER_32), sizeof(EIF_INTEGER_32));
		l_upper = (EIF_INTEGER_64)GE_integer_32_from_be(l_value);
		*a_object++ = (l_lower & GE_nat64(0x00000000FFFFFFFF)) | (l_upper << 32);
		a_buffer->position += sizeof(EIF_INTEGER_64);
	}
}

/*
 * Read `a_num' NATURAL_64 values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_natural_64(GE_storable_in_buffer* a_buffer, EIF_NATURAL_64* a_object, size_t a_num)
{
	GE_storable_in_read_integer_64(a_buffer, (EIF_INTEGER_64*)a_object, a_num);
}

/*
 * Read `a_num' CHARACTER_32 values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_character_32(GE_storable_in_buffer* a_buffer, EIF_CHARACTER_32* a_object, size_t a_num)
{
	GE_storable_in_read_integer_32(a_buffer, (EIF_INTEGER_32*)a_object, a_num);
}

/*
 * Read `a_num' REAL_64 values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_real_64(GE_storable_in_buffer* a_buffer, EIF_REAL_64* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_REAL_64 l_value;

	/* Note: REAL_64s are stored in little endian mode whereas
	   everything else is stored in big endian mode. */
	while (a_num > i++) {
		GE_storable_in_check_buffer_capacity(a_buffer, sizeof(EIF_REAL_64));
		memcpy(&l_value, a_buffer->bytes + a_buffer->position, sizeof(EIF_REAL_64));
		*a_object++ = GE_real_64_from_le(l_value);
		a_buffer->position += sizeof(EIF_REAL_64);
	}
}

/*
 * Read `a_num' REAL_32 values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_real_32(GE_storable_in_buffer* a_buffer, EIF_REAL_32* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_REAL_64 l_value;

	/* Note: REAL_32s are stored as REAL_64s. */
	while (a_num > i++) {
		GE_storable_in_read_real_64(a_buffer, &l_value, 1);
		*a_object++ = (EIF_REAL_32)l_value;
	}
}

/*
 * Read `a_num' pointer values from `a_buffer' and make them available in `a_object'.
 * `a_size' is the number of bytes to store a pointer value.
 */
static void GE_storable_in_read_pointer_with_size(GE_storable_in_buffer* a_buffer, uint64_t* a_object, size_t a_num, int8_t a_size)
{
	uint32_t l_pointer_32;
	size_t i = 0;
	char l_error_message[101];

	switch (a_size) {
	case 4:
		while (a_num > i++) {
			GE_storable_in_read_natural_32(a_buffer, &l_pointer_32, 1);
			*a_object++ = (uint64_t)l_pointer_32;
		}
		break;
	case 8:
		GE_storable_in_read_natural_64(a_buffer, a_object, a_num);
		break;
	default:
		snprintf(l_error_message, 100, "Independent retrieve: invalid pointer size: %d", a_size);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
}

/*
 * Read `a_num' pointer values from `a_buffer' and make them available in `a_object'.
 */
static void GE_storable_in_read_pointer(GE_storable_in_buffer* a_buffer, uint64_t* a_object, size_t a_num)
{
	int8_t nb;

	/* First we get the number of bytes used to store a pointer value. */
	GE_storable_in_read_integer_8(a_buffer, &nb, 1);
	GE_storable_in_read_pointer_with_size(a_buffer, a_object, a_num, nb);
}
	
/*
 * Free memory allocated by `a_buffer'.
 */
static void GE_storable_in_free_buffer(GE_storable_in_buffer* a_buffer)
{
	GE_free(a_buffer->bytes);
	GE_free(a_buffer);
}

/* Struct for Storable attributes. */
typedef struct {
	char* name; /* Attribute name. */
	uint8_t type_kind; /* Kind of type, INTEGER_8, etc. */
	int16_t type_count; /* Number of types in `types'. */
	int16_t* types; /* Attribute type and its generic parameters. */
} GE_storable_in_attribute;

/* Struct for Storable classes. */
typedef struct {
	char* name; /* Class name. */
	uint32_t flags; /* Class flags. */
	int16_t index; /* Index of class in the list of classes. */
	char* storable_version; /* Storable version of the class. */
	int16_t formal_parameter_count; /* Number of formal generic parameters. */
	uint32_t* formal_parameters; /* Formal generic parameters. */
	int16_t attribute_count; /* Number of attributes. */
	GE_storable_in_attribute** attributes; /* Attributes. */
} GE_storable_in_class;

/* Struct for addresses not resolved yet. */
typedef struct GE_storable_in_unresolved_address_struct GE_storable_in_unresolved_address;
struct GE_storable_in_unresolved_address_struct {
	uint64_t old_address;
	EIF_REFERENCE object;
	uint32_t physical_offset;
	char* class_name;
	GE_attribute* attribute;
	uint32_t special_index;
	GE_storable_in_unresolved_address* next;
};

/* Struct for Storable objects. */
typedef struct {
	uint64_t old_address;
	EIF_TYPE_INDEX type_id;
	uint32_t flags;
	EIF_REFERENCE object; /* Object. */
	GE_storable_in_unresolved_address* unresolved_address; /* Addresses not resolved yet. */
} GE_storable_in_object;

/* Struct for Storable data. */
typedef struct {
	int8_t storable_format; /* Storable format, independent_store, etc. */
	char storable_properties; /* Storable properties. */
	int16_t overhead_size; /* Size of object overhead in ISE runtime. */
	int16_t maximum_class_index; /* Maximum index value in `classes'. */
	int16_t class_count; /* Number of classes. */
	GE_storable_in_class** classes; /* Classes in schema. */
	int32_t object_count; /* Number of objects.*/
	GE_storable_in_object* objects; /* Objects. */
} GE_storable_in_data;

/*
 * New unresolved address.
 */
static GE_storable_in_unresolved_address* GE_storable_in_new_unresolved_address(uint64_t a_old_address, EIF_REFERENCE a_object, uint32_t a_physical_offset, char* a_class_name, GE_attribute* a_attribute, uint32_t a_special_index)
{
	GE_storable_in_unresolved_address* l_unresolved_address;

	l_unresolved_address = (GE_storable_in_unresolved_address*)GE_malloc(sizeof(GE_storable_in_unresolved_address));
	l_unresolved_address->old_address = a_old_address;
	l_unresolved_address->object = a_object;
	l_unresolved_address->physical_offset = a_physical_offset;
	l_unresolved_address->class_name= a_class_name;
	l_unresolved_address->attribute = a_attribute;
	l_unresolved_address->special_index = a_special_index;
	l_unresolved_address->next = 0;
	return l_unresolved_address;
}

/*
 * Free memory allocated by `a_data'.
 */
static void GE_storable_in_free_data(GE_storable_in_data* a_data)
{
	int16_t i;
	int16_t j;
	int32_t k;
	GE_storable_in_class* l_class;
	GE_storable_in_attribute* l_attribute;
	int32_t l_object_count;
	GE_storable_in_object* l_objects;
	GE_storable_in_object* l_object;
	GE_storable_in_unresolved_address* l_address;

	if (a_data->classes) {
		for (i = 0; i < a_data->class_count; i++) {
			l_class = a_data->classes[i];
			if (l_class) {
				if (l_class->name) {
					GE_free(l_class->name);
				}
				if (l_class->storable_version) {
					GE_free(l_class->storable_version);
				}
				if (l_class->formal_parameters) {
					GE_free(l_class->formal_parameters);
				}
				if (l_class->attributes) {
					for (j = 0; j < l_class->attribute_count; j++) {
						l_attribute = l_class->attributes[j];
						if (l_attribute->name) {
							GE_free(l_attribute->name);
						}
						if (l_attribute->types) {
							GE_free(l_attribute->types);
						} 
						GE_free(l_attribute);
					}
					GE_free(l_class->attributes);
				}
				GE_free(l_class);
			}
		}
		GE_free(a_data->classes);
	}
	l_objects = a_data->objects;
	if (l_objects) {
		l_object_count = a_data->object_count;
		for (k = 0; k < l_object_count; k++) {
			l_object = &(l_objects[k]);
			while (l_object->unresolved_address) {
				l_address = l_object->unresolved_address;
				l_object->unresolved_address = l_address->next;
				GE_free(l_address);
			}
		}
		GE_free(l_objects);
	}
	GE_free(a_data);
}

static EIF_REFERENCE GE_storable_retrieved_from_buffer(GE_storable_in_buffer* a_buffer);
static EIF_REFERENCE GE_storable_retrieved_with_format(GE_storable_in_buffer* a_buffer, int8_t a_storable_format);
static void GE_storable_in_read_classes(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data);
static void GE_storable_in_read_class(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_class* a_class);
static void GE_storable_in_read_attribute(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_class* a_class, GE_storable_in_attribute* a_attribute);
static void GE_storable_in_read_objects(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data);
static void GE_storable_in_read_object(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object);
static void GE_storable_in_read_subobject(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object);
static void GE_storable_in_read_tuple_subobject(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object);
static void GE_storable_in_read_special_subobject(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object);
static void GE_storable_in_read_regular_subobject(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object);
static void GE_storable_in_read_object_type(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object);
static void GE_storable_in_resolve_object_type(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object, int32_t** volatile a_types_ptr, char** volatile a_type_name_ptr);
static EIF_TYPE_INDEX GE_storable_in_type_id_from_name(char* a_name);
static int GE_storable_in_resolve_address(GE_storable_in_data* a_data, GE_storable_in_object* a_object, GE_storable_in_unresolved_address* a_address);
static void GE_storable_in_resolve_all_addresses(GE_storable_in_data* a_data);

/*
 * Object retrieved fron Storable buffer `a_buffer'.
 */
static EIF_REFERENCE GE_storable_retrieved_from_buffer(GE_storable_in_buffer* a_buffer)
{
	int8_t l_storable_format;
	char l_storable_properties;
	char l_error_message[101];

	a_buffer->read_char(a_buffer, (char*)&l_storable_format, 1);
	switch (l_storable_format) {
	case GE_INDEPENDENT_STORE_6_6:
		return GE_storable_retrieved_with_format(a_buffer, l_storable_format);
	default:
		snprintf(l_error_message, 100, "Storable format not supported: 0x%hhX", l_storable_format);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	return (EIF_REFERENCE) 0;
}

/*
 * Object retrieved fron Storable buffer `a_buffer'.
 */
static EIF_REFERENCE GE_storable_retrieved_with_format(GE_storable_in_buffer* a_buffer, int8_t a_storable_format)
{
	GE_storable_in_data* l_data;
	EIF_REFERENCE l_object;
	char l_error_message[101];

	l_data = (GE_storable_in_data*)GE_calloc(1, sizeof(GE_storable_in_data));
	l_data->storable_format = a_storable_format;
	a_buffer->read_char(a_buffer, &(l_data->storable_properties), 1);
	GE_storable_in_read_integer_16(a_buffer, &(l_data->overhead_size), 1);
	GE_storable_in_read_integer_16(a_buffer, &(l_data->maximum_class_index), 1);
	if (l_data->maximum_class_index < 0) {
		snprintf(l_error_message, 100, "Independent retrieve: negative maximum_class_index: %d", l_data->maximum_class_index);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	l_data->classes = (GE_storable_in_class**)GE_calloc(l_data->maximum_class_index + 1, sizeof(GE_storable_in_class*));
	GE_storable_in_read_integer_16(a_buffer, &(l_data->class_count), 1);
	if (l_data->class_count < 0) {
		snprintf(l_error_message, 100, "Independent retrieve: negative class_count: %d", l_data->class_count);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	} else if (l_data->class_count > (l_data->maximum_class_index + 1)) {
		snprintf(l_error_message, 100, "Independent retrieve: class_count (%d) greater than maximum_class_index + 1 (%d)", l_data->class_count, l_data->maximum_class_index + 1);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	GE_storable_in_read_classes(a_buffer, l_data);
	GE_storable_in_read_objects(a_buffer, l_data);
	/* The root object is the last in the list. */
	l_object = l_data->objects[l_data-> object_count - 1].object;
	GE_storable_in_free_data(l_data);
	return (EIF_REFERENCE)l_object;
}

/*
 * Read class descriptions from Storable buffer `a_buffer'.
 */
static void GE_storable_in_read_classes(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data)
{
	int16_t i;
	GE_storable_in_class* l_class;

	for(i = 0; i < a_data->class_count; i++) {
		l_class = (GE_storable_in_class*)GE_calloc(1, sizeof(GE_storable_in_class));
		GE_storable_in_read_class(a_buffer, a_data, l_class);
		a_data->classes[l_class->index] = l_class;
	}
}

/*
 * Read class description from Storable buffer `a_buffer'.
 */
static void GE_storable_in_read_class(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_class* a_class)
{
	int16_t nb;
	int16_t i;
	char* l_name;
	uint32_t nb2;
	GE_storable_in_attribute* l_attribute;
	char l_error_message[201];

	/* Read class name. */
	GE_storable_in_read_integer_16(a_buffer, &nb, 1);
	if (nb <= 0) {
		GE_free(a_class);
		snprintf(l_error_message, 200, "Independent retrieve: negative length of class name: %d", nb);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	l_name = (char*)GE_malloc_atomic((nb + 1) * sizeof(char));
	a_class->name = l_name;
	GE_storable_in_read_character_8(a_buffer, (EIF_CHARACTER_8*)l_name, nb);
	l_name[nb] = '\0';
	GE_storable_in_read_natural_32(a_buffer, &(a_class->flags), 1);
	GE_storable_in_read_integer_16(a_buffer, &(a_class->index), 1);
	if (a_class->index < 0) {
		GE_free(l_name);
		GE_free(a_class);
		snprintf(l_error_message, 200, "Independent retrieve: negative class index for class %s: %d", l_name, a_class->index);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	} else if (a_class->index > a_data->maximum_class_index) {
		GE_free(l_name);
		GE_free(a_class);
		snprintf(l_error_message, 200, "Independent retrieve: class index (%d) for class %s greater than maximum_class_index (%d)", a_class->index, l_name, a_data->maximum_class_index);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	a_data->classes[a_class->index] = a_class;
	/* Read storable version of the class. */
	GE_storable_in_read_natural_32(a_buffer, &nb2, 1);
	if (nb2 < 0) {
		snprintf(l_error_message, 200, "Independent retrieve: negative length of storable version (%d) for class %s", nb2, l_name);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	} else if (nb2 > 0) {
		l_name = (char*)GE_malloc_atomic((nb2 + 1) * sizeof(char));
		a_class->storable_version = l_name;
		GE_storable_in_read_character_8(a_buffer, (EIF_CHARACTER_8*)l_name, nb2);
		l_name[nb2] = '\0';
	}
	/* Read formal generic parameters. */
	GE_storable_in_read_integer_16(a_buffer, &(a_class->formal_parameter_count), 1);
	if (a_class->formal_parameter_count < 0) {
		snprintf(l_error_message, 200, "Independent retrieve: negative number of formal generic parameters (%d) for class %s", a_class->formal_parameter_count, l_name);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	} else if (a_class->formal_parameter_count > 0) {
		a_class->formal_parameters = (uint32_t*)GE_malloc_atomic(a_class->formal_parameter_count * sizeof(uint32_t));
		GE_storable_in_read_natural_32(a_buffer, a_class->formal_parameters, a_class->formal_parameter_count);
	}
	/* Read attributes. */
	GE_storable_in_read_integer_16(a_buffer, &(a_class->attribute_count), 1);
	if (a_class->attribute_count < 0) {
		snprintf(l_error_message, 200, "Independent retrieve: negative number of attributes (%d) for class %s", a_class->attribute_count, l_name);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	a_class->attributes = (GE_storable_in_attribute**)GE_calloc(a_class->attribute_count, sizeof(GE_storable_in_attribute*));
	for (i = 0; i < a_class->attribute_count; i ++) {
		l_attribute = (GE_storable_in_attribute*)GE_calloc(1, sizeof(GE_storable_in_attribute));
		a_class->attributes[i] = l_attribute;
		GE_storable_in_read_attribute(a_buffer, a_data, a_class, l_attribute);
	}
}

/*
 * Read attribute description from Storable buffer `a_buffer'.
 */
static void GE_storable_in_read_attribute(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_class* a_class, GE_storable_in_attribute* a_attribute)
{
	int16_t nb;
	char* l_name;
	char l_error_message[201];

		/* Read attribute name. */
	GE_storable_in_read_integer_16(a_buffer, &nb, 1);
	if (nb <= 0) {
		snprintf(l_error_message, 200, "Independent retrieve: negative length of attribute name in class %s: %d", a_class->name, nb);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	l_name = (char*)GE_malloc_atomic((nb + 1) * sizeof(char));
	a_attribute->name = l_name;
	GE_storable_in_read_character_8(a_buffer, (EIF_CHARACTER_8*)l_name, nb);
	l_name[nb] = '\0';
	GE_storable_in_read_natural_8(a_buffer, &(a_attribute->type_kind), 1);
	GE_storable_in_read_integer_16(a_buffer, &(a_attribute->type_count), 1);
	if (a_attribute->type_count <= 0) {
		snprintf(l_error_message, 200, "Independent retrieve: negative number of type elements for attribute `%s` in class %s: %d", l_name, a_class->name, a_attribute->type_count);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	a_attribute->types = (int16_t*)GE_malloc_atomic(a_attribute->type_count * sizeof(int16_t));
	GE_storable_in_read_integer_16(a_buffer, a_attribute->types, a_attribute->type_count);
}

/*
 * Read objects from Storable buffer `a_buffer'.
 */
static void GE_storable_in_read_objects(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data)
{
	int32_t i;
	char l_error_message[101];

	GE_storable_in_read_integer_32(a_buffer, &(a_data->object_count), 1);
	if (a_data->object_count <= 0) {
		snprintf(l_error_message, 100, "Independent retrieve: negative number of objects to be retrieved: %d", a_data->object_count);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	a_data->objects = (GE_storable_in_object*)GE_calloc(a_data->object_count, sizeof(GE_storable_in_object));
	for (i = 0; i < a_data->object_count; i++) {
		GE_storable_in_read_object(a_buffer, a_data, &(a_data->objects[i]));
	}
	GE_storable_in_resolve_all_addresses(a_data);
}

/*
 * Read object from Storable buffer `a_buffer'.
 */
static void GE_storable_in_read_object(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object)
{
	GE_storable_in_read_pointer(a_buffer, &(a_object->old_address), 1);
	GE_storable_in_read_natural_32(a_buffer, &(a_object->flags), 1);
	GE_storable_in_read_object_type(a_buffer, a_data, a_object);
	GE_storable_in_read_subobject(a_buffer, a_data, a_object);
}


/*
 * Read object from Storable buffer `a_buffer'.
 */
static void GE_storable_in_read_subobject(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object)
{
	if (a_object->flags & GE_STORABLE_EO_TUPLE) {
		GE_storable_in_read_tuple_subobject(a_buffer, a_data, a_object);
	} else if (a_object->flags & GE_STORABLE_EO_SPEC) {
		GE_storable_in_read_special_subobject(a_buffer, a_data, a_object);
	} else {
		GE_storable_in_read_regular_subobject(a_buffer, a_data, a_object);
	}
}

/*
 * Read TUPLE object from Storable buffer `a_buffer'.
 */
static void GE_storable_in_read_tuple_subobject(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object)
{
	EIF_TYPE_INDEX l_type_id;
	GE_type_info* l_type_info;
	uint32_t l_count;
	uint32_t l_capacity;
	EIF_REFERENCE l_object;
	EIF_REFERENCE (*l_new)();
	uint32_t i;
	uint8_t l_code;
	EIF_BOOLEAN l_bool;
	EIF_CHARACTER_8 l_char8;
	EIF_CHARACTER_32 l_char32;
	EIF_INTEGER_8 l_int8;
	EIF_INTEGER_16 l_int16;
	EIF_INTEGER_32 l_int32;
	EIF_INTEGER_64 l_int64;
	EIF_NATURAL_8 l_nat8;
	EIF_NATURAL_16 l_nat16;
	EIF_NATURAL_32 l_nat32;
	EIF_NATURAL_64 l_nat64;
	EIF_REAL_32 l_real32;
	EIF_REAL_64 l_real64;
	uint64_t l_pointer;
	GE_storable_in_object l_expanded_object = {0, 0, 0, 0};
	GE_attribute* l_runtime_attribute;
	EIF_TYPE_INDEX l_runtime_type;
	GE_storable_in_unresolved_address* l_unresolved_address;
	GE_storable_in_object* l_other_object;
	uint32_t l_other_object_offset;
	uint64_t l_object_index;
	int32_t l_object_count;
	GE_storable_in_object* l_objects;
	int32_t j;
	char l_error_message[201];

	l_type_id = a_object->type_id;
	if (l_type_id <= 0 || l_type_id > GE_type_info_count) {
		GE_raise_with_message(GE_EX_RETR, "Independent retrieve: object type not in current system");
	}
	l_type_info = &(GE_type_infos[l_type_id]);
	if (!(l_type_info->flags & GE_TYPE_FLAG_TUPLE)) {
		GE_raise_with_message(GE_EX_RETR, "Independent retrieve: object type should be TUPLE");
	}
	l_new = l_type_info->new_instance;
	if (!l_new) {
		GE_raise_with_message(GE_EX_RETR, "Independent retrieve: cannot create retrieved object");
	}
	if (!(a_object->flags & GE_STORABLE_EO_SPEC)) {
		GE_raise_with_message(GE_EX_RETR, "Independent retrieve: TUPLE is not stored with the expected format");
	}
	GE_storable_in_read_natural_32(a_buffer, &l_count, 1);
	GE_storable_in_read_natural_32(a_buffer, &l_capacity, 1);
	l_object = l_new(GE_current_context(), EIF_TRUE);
	a_object->object = l_object;
	while (a_object->unresolved_address && GE_storable_in_resolve_address(a_data, a_object, a_object->unresolved_address)) {
		l_unresolved_address = a_object->unresolved_address;
		a_object->unresolved_address = l_unresolved_address->next;
		GE_free(l_unresolved_address);
	}
	if (l_count != l_type_info->attribute_count) {
		GE_raise_with_message(GE_EX_RETR, "Independent retrieve: different number of Tuple items in current system");
	}	
	/* `object_comparison` is the first item stored in the Tuple. */
	GE_storable_in_read_natural_8(a_buffer, &l_code, 1);
	if (l_code != GE_STORABLE_TUPLE_BOOLEAN_CODE) {
		GE_raise_with_message(GE_EX_RETR, "Independent retrieve: invalid parameter type code for TUPLE's 'object_comparison'(BOOLEAN expected)");
	}
	GE_storable_in_read_boolean(a_buffer, &l_bool, 1);
	/* `object_comparison` is the first attribute in the current system. */
	/* Then Tuple elements are stored in order. */
	GE_set_boolean_field_at(l_type_info->attributes[0]->offset, l_object, 0, l_bool);
	for (i = 1; i < l_count; i++) {
		l_runtime_attribute = l_type_info->attributes[i];
		l_runtime_type = GE_decoded_type(l_runtime_attribute->type_id).id;
		GE_storable_in_read_natural_8(a_buffer, &l_code, 1);
		switch (l_code) {
		case GE_STORABLE_TUPLE_REFERENCE_CODE:
			GE_storable_in_read_pointer(a_buffer, &l_pointer, 1);
			if (GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not a reference in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			if (GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_EXPANDED) {
				if (!l_pointer) {
					snprintf(l_error_message, 200, "Independent retrieve: expanded item of item `%d` in Tuple cannot be Void in current system", i);
					GE_raise_with_message(GE_EX_RETR, l_error_message);
				}
				l_object_count = a_data->object_count;
				l_objects = a_data->objects;
				l_other_object = 0;
				for (j = 0; j < l_object_count; j++) {
					l_other_object = &(l_objects[j]);
					if (l_other_object->old_address == l_pointer) {
						break;
					}
					l_other_object = 0;
				}
				if (!l_other_object) {
					snprintf(l_error_message, 200, "Independent retrieve: unable to find the object for expanded item `%d` in Tuple", i);
					GE_raise_with_message(GE_EX_RETR, l_error_message);
				}
				if (l_other_object->type_id != l_runtime_type) {
					snprintf(l_error_message, 200, "Independent retrieve: type of expanded item `%d` in Tuple is the same in current system", i);
					GE_raise_with_message(GE_EX_RETR, l_error_message);
				}
				l_other_object_offset = GE_type_infos[l_runtime_type].attributes[GE_type_infos[l_runtime_type].attribute_count]->offset;
				memcpy((char*)GE_field_address_at(l_runtime_attribute->offset, l_object, 0), (char*)GE_field_address_at(l_other_object_offset, l_other_object->object, 0), l_runtime_attribute->size);
			} else if (l_pointer) {
				l_unresolved_address = GE_storable_in_new_unresolved_address(l_pointer, l_object, 0, "TUPLE", l_runtime_attribute, 0);
				l_object_index = l_pointer & 0x000000000FFFFFFF;
				if (l_object_index > 0 && l_object_index <= a_data->object_count) {
					l_object_index--;
				} else {
					l_object_index = a_data->object_count - 1;
				}
				l_other_object = &(a_data->objects[l_object_index]);
				if (!GE_storable_in_resolve_address(a_data, l_other_object, l_unresolved_address)) {
					l_unresolved_address->next = l_other_object->unresolved_address;
					l_other_object->unresolved_address = l_unresolved_address;
				} else {
					GE_free(l_unresolved_address);
				}
			} else if (!GE_type_in_dynamic_type_set(0, l_runtime_attribute->dynamic_type_set, l_runtime_attribute->dynamic_type_count)) {
				snprintf(l_error_message, 200, "Independent retrieve: dynamic type set of item `%d` in Tuple does not include Void in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			break;
		case GE_STORABLE_TUPLE_BOOLEAN_CODE:
			GE_storable_in_read_boolean(a_buffer, &l_bool, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_BOOLEAN) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not BOOLEAN in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_boolean_field_at(l_runtime_attribute->offset, l_object, 0, l_bool);
			break;
		case GE_STORABLE_TUPLE_CHARACTER_8_CODE:
			GE_storable_in_read_character_8(a_buffer, &l_char8, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_CHARACTER_8) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not CHARACTER_8 in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_character_8_field_at(l_runtime_attribute->offset, l_object, 0, l_char8);
			break;
		case GE_STORABLE_TUPLE_REAL_64_CODE:
			GE_storable_in_read_real_64(a_buffer, &l_real64, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_REAL_64) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not REAL_64 in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_real_64_field_at(l_runtime_attribute->offset, l_object, 0, l_real64);
			break;
		case GE_STORABLE_TUPLE_REAL_32_CODE:
			GE_storable_in_read_real_32(a_buffer, &l_real32, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_REAL_32) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not REAL_32 in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_real_32_field_at(l_runtime_attribute->offset, l_object, 0, l_real32);
			break;
		case GE_STORABLE_TUPLE_POINTER_CODE:
			GE_storable_in_read_pointer(a_buffer, &l_pointer, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_POINTER) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not POINTER in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			if (!GE_current_context()->storable_discard_pointer_values) {
				if (sizeof(EIF_POINTER) == sizeof(uint64_t)) {
					GE_set_pointer_field_at(l_runtime_attribute->offset, l_object, 0, (EIF_POINTER)l_pointer);
				} else {
					GE_set_pointer_field_at(l_runtime_attribute->offset, l_object, 0, (EIF_POINTER)(l_pointer & GE_nat64(0x00000000FFFFFFFF)));
				}
			}
			break;
		case GE_STORABLE_TUPLE_INTEGER_8_CODE:
			GE_storable_in_read_integer_8(a_buffer, &l_int8, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_INTEGER_8) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not INTEGER_8 in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_integer_8_field_at(l_runtime_attribute->offset, l_object, 0, l_int8);
			break;
		case GE_STORABLE_TUPLE_INTEGER_16_CODE:
			GE_storable_in_read_integer_16(a_buffer, &l_int16, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_INTEGER_16) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not INTEGER_16 in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_integer_16_field_at(l_runtime_attribute->offset, l_object, 0, l_int16);
			break;
		case GE_STORABLE_TUPLE_INTEGER_32_CODE:
			GE_storable_in_read_integer_32(a_buffer, &l_int32, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_INTEGER_32) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not INTEGER_32 in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_integer_32_field_at(l_runtime_attribute->offset, l_object, 0, l_int32);
			break;
		case GE_STORABLE_TUPLE_INTEGER_64_CODE:
			GE_storable_in_read_integer_64(a_buffer, &l_int64, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_INTEGER_64) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not INTEGER_64 in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_integer_64_field_at(l_runtime_attribute->offset, l_object, 0, l_int64);
			break;
		case GE_STORABLE_TUPLE_NATURAL_8_CODE:
			GE_storable_in_read_natural_8(a_buffer, &l_nat8, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_NATURAL_8) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not NATURAL_8 in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_natural_8_field_at(l_runtime_attribute->offset, l_object, 0, l_nat8);
			break;
		case GE_STORABLE_TUPLE_NATURAL_16_CODE:
			GE_storable_in_read_natural_16(a_buffer, &l_nat16, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_NATURAL_16) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not NATURAL_16 in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_natural_16_field_at(l_runtime_attribute->offset, l_object, 0, l_nat16);
			break;
		case GE_STORABLE_TUPLE_NATURAL_32_CODE:
			GE_storable_in_read_natural_32(a_buffer, &l_nat32, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_NATURAL_32) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not NATURAL_32 in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_natural_32_field_at(l_runtime_attribute->offset, l_object, 0, l_nat32);
			break;
		case GE_STORABLE_TUPLE_NATURAL_64_CODE:
			GE_storable_in_read_natural_64(a_buffer, &l_nat64, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_NATURAL_64) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not NATURAL_64 in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_natural_64_field_at(l_runtime_attribute->offset, l_object, 0, l_nat64);
			break;
		case GE_STORABLE_TUPLE_CHARACTER_32_CODE:
			GE_storable_in_read_character_32(a_buffer, &l_char32, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_CHARACTER_32) {
				snprintf(l_error_message, 200, "Independent retrieve: type of item `%d` in Tuple is not CHARACTER_32 in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_character_32_field_at(l_runtime_attribute->offset, l_object, 0, l_char32);
			break;
		default:
			GE_raise_with_message(GE_EX_RETR, "Independent retrieve: invalid parameter type code for Tuple item");
		}
	}
}

/*
 * Read SPECIAL object from Storable buffer `a_buffer'.
 */
static void GE_storable_in_read_special_subobject(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object)
{
	EIF_TYPE_INDEX l_type_id;
	GE_type_info* l_type_info;
	uint32_t l_count;
	uint32_t l_capacity;
	EIF_REFERENCE l_object;
	EIF_REFERENCE (*l_new)();
	uint32_t i;
	uint64_t l_pointer;
	uint16_t l_item_flags;
	GE_storable_in_object l_expanded_object = {0, 0, 0, 0};
	uint32_t l_item_offset;
	uint32_t l_item_size;
	int8_t l_pointer_size;
	GE_storable_in_unresolved_address* l_unresolved_address;
	GE_storable_in_object* l_other_object;
	uint64_t l_object_index;
	GE_attribute* l_runtime_attribute;
	char l_error_message[201];

	l_type_id = a_object->type_id;
	if (l_type_id <= 0 || l_type_id > GE_type_info_count) {
		GE_raise_with_message(GE_EX_RETR, "Independent retrieve: object type not in current system");
	}
	l_type_info = &(GE_type_infos[l_type_id]);
	if (!(l_type_info->flags & GE_TYPE_FLAG_SPECIAL)) {
		GE_raise_with_message(GE_EX_RETR, "Independent retrieve: object type should be SPECIAL");
	}
	l_new = l_type_info->new_instance;
	if (!l_new) {
		GE_raise_with_message(GE_EX_RETR, "Independent retrieve: cannot create retrieved object");
	}
	GE_storable_in_read_natural_32(a_buffer, &l_count, 1);
	GE_storable_in_read_natural_32(a_buffer, &l_capacity, 1);
	l_object = l_new(GE_current_context(), (EIF_INTEGER)l_capacity, EIF_TRUE);
	a_object->object = l_object;
	while (a_object->unresolved_address && GE_storable_in_resolve_address(a_data, a_object, a_object->unresolved_address)) {
		l_unresolved_address = a_object->unresolved_address;
		a_object->unresolved_address = l_unresolved_address->next;
		GE_free(l_unresolved_address);
	}
	((EIF_SPECIAL*)l_object)->count = (EIF_INTEGER)l_count;
	/* Note: the third attribute is for the item offset. */
	l_runtime_attribute = l_type_info->attributes[2];
	l_item_offset = l_runtime_attribute->offset;
	l_item_flags = GE_type_infos[GE_decoded_type(l_runtime_attribute->type_id).id].flags;
	if (!(l_item_flags & GE_TYPE_FLAG_EXPANDED)) {
		GE_storable_in_read_integer_8(a_buffer, &l_pointer_size, 1);
		for (i = 0; i < l_count; i++) {
			GE_storable_in_read_pointer_with_size(a_buffer, &l_pointer, 1, l_pointer_size);
			if (l_pointer) {
				l_unresolved_address = GE_storable_in_new_unresolved_address(l_pointer, l_object, 0, "SPECIAL", l_runtime_attribute, i);
				l_object_index = l_pointer & 0x000000000FFFFFFF;
				if (l_object_index > 0 && l_object_index <= a_data->object_count) {
					l_object_index--;
				} else {
					l_object_index = a_data->object_count - 1;
				}
				l_other_object = &(a_data->objects[l_object_index]);
				if (!GE_storable_in_resolve_address(a_data, l_other_object, l_unresolved_address)) {
					l_unresolved_address->next = l_other_object->unresolved_address;
					l_other_object->unresolved_address = l_unresolved_address;
				} else {
					GE_free(l_unresolved_address);
				}
			} else if (!GE_type_in_dynamic_type_set(0, l_runtime_attribute->dynamic_type_set, l_runtime_attribute->dynamic_type_count)) {
				snprintf(l_error_message, 200, "Independent retrieve: dynamic type set of item `%d` in Special does not include Void in current system", i);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
		}
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_BOOLEAN) {
		GE_storable_in_read_boolean(a_buffer, (EIF_BOOLEAN*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_CHARACTER_8) {
		GE_storable_in_read_character_8(a_buffer, (EIF_CHARACTER_8*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_CHARACTER_32) {
		GE_storable_in_read_character_32(a_buffer, (EIF_CHARACTER_32*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_8) {
		GE_storable_in_read_integer_8(a_buffer, (EIF_INTEGER_8*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_16) {
		GE_storable_in_read_integer_16(a_buffer, (EIF_INTEGER_16*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_32) {
		GE_storable_in_read_integer_32(a_buffer, (EIF_INTEGER_32*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_64) {
		GE_storable_in_read_integer_64(a_buffer, (EIF_INTEGER_64*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_8) {
		GE_storable_in_read_natural_8(a_buffer, (EIF_NATURAL_8*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_16) {
		GE_storable_in_read_natural_16(a_buffer, (EIF_NATURAL_16*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_32) {
		GE_storable_in_read_natural_32(a_buffer, (EIF_NATURAL_32*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_64) {
		GE_storable_in_read_natural_64(a_buffer, (EIF_NATURAL_64*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_REAL_32) {
		GE_storable_in_read_real_32(a_buffer, (EIF_REAL_32*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_REAL_64) {
		GE_storable_in_read_real_64(a_buffer, (EIF_REAL_64*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_POINTER) {
		if (GE_current_context()->storable_discard_pointer_values) {
			GE_storable_in_read_integer_8(a_buffer, &l_pointer_size, 1);
			for (i = 0; i < l_count; i++) {
				GE_storable_in_read_pointer_with_size(a_buffer, &l_pointer, 1, l_pointer_size);
			}
		} else if (sizeof(EIF_POINTER) == sizeof(uint64_t)) {
			GE_storable_in_read_pointer(a_buffer, (uint64_t*)GE_field_address_at(l_item_offset, l_object, 0), l_count);
		} else {
			GE_storable_in_read_integer_8(a_buffer, &l_pointer_size, 1);
			for (i = 0; i < l_count; i++) {
				GE_storable_in_read_pointer_with_size(a_buffer, &l_pointer, 1, l_pointer_size);
				GE_set_pointer_field_at(l_item_offset + i * sizeof(EIF_POINTER), l_object, 0, (EIF_POINTER)(l_pointer & GE_nat64(0x00000000FFFFFFFF)));
			}
		}
	} else {
		/* User-defined expanded item type. */
		GE_storable_in_read_natural_32(a_buffer, &(l_expanded_object.flags), 1);
		GE_storable_in_read_object_type(a_buffer, a_data, &l_expanded_object);
		l_item_size = l_runtime_attribute->size;
		for (i = 0; i < l_count; i++) {
			l_expanded_object.object = (EIF_REFERENCE)GE_field_address_at(l_item_offset + i * l_item_size, l_object, 0);
			GE_storable_in_read_subobject(a_buffer, a_data, &l_expanded_object);
		}
	}
}

/*
 * Read regular object from Storable buffer `a_buffer'.
 */
static void GE_storable_in_read_regular_subobject(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object)
{
	EIF_TYPE_INDEX l_type_id;
	GE_type_info* l_type_info;
	EIF_REFERENCE l_object;
	EIF_REFERENCE (*l_new)();
	uint32_t l_index;
	GE_storable_in_class* l_class;
	int16_t l_attribute_count;
	int16_t i;
	char* l_attribute_name;
	GE_storable_in_attribute* l_attribute;
	EIF_BOOLEAN l_bool;
	EIF_CHARACTER_8 l_char8;
	EIF_CHARACTER_32 l_char32;
	EIF_INTEGER_8 l_int8;
	EIF_INTEGER_16 l_int16;
	EIF_INTEGER_32 l_int32;
	EIF_INTEGER_64 l_int64;
	EIF_NATURAL_8 l_nat8;
	EIF_NATURAL_16 l_nat16;
	EIF_NATURAL_32 l_nat32;
	EIF_NATURAL_64 l_nat64;
	EIF_REAL_32 l_real32;
	EIF_REAL_64 l_real64;
	uint64_t l_pointer;
	GE_storable_in_object l_expanded_object = {0, 0, 0, 0};
	uint32_t l_physical_offset = 0;
	GE_attribute* l_runtime_attribute;
	EIF_TYPE_INDEX l_runtime_type;
	GE_storable_in_unresolved_address* l_unresolved_address;
	GE_storable_in_object* l_other_object;
	uint64_t l_object_index;
	char l_error_message[201];

	l_type_id = a_object->type_id;
	if (l_type_id <= 0 || l_type_id > GE_type_info_count) {
		snprintf(l_error_message, 200, "Independent retrieve: object type with id %d not in current system", l_type_id);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	l_type_info = &(GE_type_infos[l_type_id]);
	l_object = a_object->object;
	if (l_object) {
		/* This is an expanded object within another object. */
	} else {
		l_new = l_type_info->new_instance;
		if (!l_new) {
			snprintf(l_error_message, 200, "Independent retrieve: cannot create retrieved object with type id %d", l_type_id);
			GE_raise_with_message(GE_EX_RETR, l_error_message);
		}
		l_object = l_new(GE_current_context(), EIF_TRUE);
		a_object->object = l_object;
		if ((l_type_info->flags & GE_TYPE_FLAG_EXPANDED) && !(l_type_info->flags & GE_TYPE_FLAG_BASIC_MASK)) {
			/* This is a boxed expanded object. */
			l_physical_offset = l_type_info->attributes[l_type_info->attribute_count]->offset;
		}
	}
	while (a_object->unresolved_address && GE_storable_in_resolve_address(a_data, a_object, a_object->unresolved_address)) {
		l_unresolved_address = a_object->unresolved_address;
		a_object->unresolved_address = l_unresolved_address->next;
		GE_free(l_unresolved_address);
	}
	l_index = (a_object->flags & GE_STORABLE_EO_TYPE);
	if (l_index < 0 || l_index > a_data->maximum_class_index) {
		snprintf(l_error_message, 200, "Independent retrieve: invalid class index: %d", l_index);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	l_class = a_data->classes[l_index];
	if (!l_class || !l_class->name) {
		snprintf(l_error_message, 200, "Independent retrieve: no class with index: %d", l_index);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	l_attribute_count = l_class->attribute_count;
	if (l_attribute_count != l_type_info->attribute_count) {
		snprintf(l_error_message, 200, "Independent retrieve: different number of attributes for class %s in current system", l_class->name);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	/*  Note: attributes are stored in reverse order in the Storable file! */
	for (i = l_attribute_count - 1; i >= 0; i--) {
		l_attribute = l_class->attributes[i];
		l_attribute_name = l_attribute->name;
		if (!l_attribute_name) {
			snprintf(l_error_message, 200, "Independent retrieve: unknown attribute name in class %s", l_class->name);
			GE_raise_with_message(GE_EX_RETR, l_error_message);
		}
		l_runtime_attribute = GE_attribute_with_name(l_type_id, l_attribute_name);
		if (!l_runtime_attribute) {
			snprintf(l_error_message, 200, "Independent retrieve: no attribute `%s` in class %s in current system", l_attribute_name, l_class->name);
			GE_raise_with_message(GE_EX_RETR, l_error_message);
		}
		l_runtime_type = GE_decoded_type(l_runtime_attribute->type_id).id;
		switch (l_attribute->type_kind) {
		case GE_STORABLE_SK_BOOL:
			GE_storable_in_read_boolean(a_buffer, &l_bool, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_BOOLEAN) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not BOOLEAN in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_boolean_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_bool);
			break;
		case GE_STORABLE_SK_CHAR8:
			GE_storable_in_read_character_8(a_buffer, &l_char8, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_CHARACTER_8) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not CHARACTER_8 in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_character_8_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_char8);
			break;
		case GE_STORABLE_SK_INT8:
			GE_storable_in_read_integer_8(a_buffer, &l_int8, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_INTEGER_8) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not INTEGER_8 in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_integer_8_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_int8);
			break;
		case GE_STORABLE_SK_INT32:
			GE_storable_in_read_integer_32(a_buffer, &l_int32, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_INTEGER_32) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not INTEGER_32 in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_integer_32_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_int32);
			break;
		case GE_STORABLE_SK_INT16:
			GE_storable_in_read_integer_16(a_buffer, &l_int16, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_INTEGER_16) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not INTEGER_16 in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_integer_16_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_int16);
			break;
		case GE_STORABLE_SK_REAL32:
			GE_storable_in_read_real_32(a_buffer, &l_real32, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_REAL_32) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not REAL_32 in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_real_32_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_real32);
			break;
		case GE_STORABLE_SK_CHAR32:
			GE_storable_in_read_character_32(a_buffer, &l_char32, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_CHARACTER_32) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not CHARACTER_32 in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_character_32_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_char32);
			break;
		case GE_STORABLE_SK_REAL64:
			GE_storable_in_read_real_64(a_buffer, &l_real64, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_REAL_64) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not REAL_64 in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_real_64_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_real64);
			break;
		case GE_STORABLE_SK_INT64:
			GE_storable_in_read_integer_64(a_buffer, &l_int64, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_INTEGER_64) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not INTEGER_64 in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_integer_64_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_int64);
			break;
		case GE_STORABLE_SK_UINT8:
			GE_storable_in_read_natural_8(a_buffer, &l_nat8, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_NATURAL_8) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not NATURAL_8 in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_natural_8_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_nat8);
			break;
		case GE_STORABLE_SK_UINT16:
			GE_storable_in_read_natural_16(a_buffer, &l_nat16, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_NATURAL_16) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not NATURAL_16 in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_natural_16_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_nat16);
			break;
		case GE_STORABLE_SK_UINT32:
			GE_storable_in_read_natural_32(a_buffer, &l_nat32, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_NATURAL_32) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not NATURAL_32 in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_natural_32_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_nat32);
			break;
		case GE_STORABLE_SK_UINT64:
			GE_storable_in_read_natural_64(a_buffer, &l_nat64, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_NATURAL_64) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not NATURAL_64 in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_set_natural_64_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, l_nat64);
			break;
		case GE_STORABLE_SK_POINTER:
			GE_storable_in_read_pointer(a_buffer, &l_pointer, 1);
			if ((GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_BASIC_MASK) != GE_TYPE_FLAG_POINTER) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not POINTER in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			if (!GE_current_context()->storable_discard_pointer_values) {
				if (sizeof(EIF_POINTER) == sizeof(uint64_t)) {
					GE_set_pointer_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, (EIF_POINTER)l_pointer);
				} else {
					GE_set_pointer_field_at(l_runtime_attribute->offset, l_object, l_physical_offset, (EIF_POINTER)(l_pointer & GE_nat64(0x00000000FFFFFFFF)));
				}
			}
			break;
		case GE_STORABLE_SK_REF:
			GE_storable_in_read_pointer(a_buffer, &l_pointer, 1);
			if (l_pointer) {
				l_unresolved_address = GE_storable_in_new_unresolved_address(l_pointer, l_object, l_physical_offset, l_class->name, l_runtime_attribute, 0);
				l_object_index = l_pointer & 0x000000000FFFFFFF;
				if (l_object_index > 0 && l_object_index <= a_data->object_count) {
					l_object_index--;
				} else {
					l_object_index = a_data->object_count - 1;
				}
				l_other_object = &(a_data->objects[l_object_index]);
				if (!GE_storable_in_resolve_address(a_data, l_other_object, l_unresolved_address)) {
					l_unresolved_address->next = l_other_object->unresolved_address;
					l_other_object->unresolved_address = l_unresolved_address;
				} else {
					GE_free(l_unresolved_address);
				}
			} else if (!GE_type_in_dynamic_type_set(0, l_runtime_attribute->dynamic_type_set, l_runtime_attribute->dynamic_type_count)) {
				snprintf(l_error_message, 200, "Independent retrieve: dynamic type set of attribute `%s` in class %s does not include Void in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			break;
		case GE_STORABLE_SK_EXP:
			if (!(GE_type_infos[l_runtime_type].flags & GE_TYPE_FLAG_EXPANDED)) {
				snprintf(l_error_message, 200, "Independent retrieve: type of attribute `%s` in class %s is not expanded in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			GE_storable_in_read_pointer(a_buffer, &(l_expanded_object.old_address), 1);
			GE_storable_in_read_natural_32(a_buffer, &(l_expanded_object.flags), 1);
			GE_storable_in_read_object_type(a_buffer, a_data, &l_expanded_object);
			if (l_expanded_object.type_id != l_runtime_type) {
				snprintf(l_error_message, 200, "Independent retrieve: type of expanded attribute `%s` in class %s is the same in current system", l_attribute_name, l_class->name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
			l_expanded_object.object = (EIF_REFERENCE)GE_field_address_at(l_runtime_attribute->offset, l_object, l_physical_offset);
			GE_storable_in_read_subobject(a_buffer, a_data, &l_expanded_object);
			break;
		default:
			snprintf(l_error_message, 200, "Independent retrieve: unknown type for attribute `%s` in class %s", l_attribute_name, l_class->name);
			GE_raise_with_message(GE_EX_RETR, l_error_message);
		}
	}
}

/*
 * Read object type from Storable buffer `a_buffer'.
 */
static void GE_storable_in_read_object_type(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object)
{
	uint32_t nb;
	uint32_t i;
	uint32_t nb_char = 0;
	int32_t* l_types;
	int32_t l_type;
	GE_storable_in_class* l_class;
	char* l_type_name;
	int32_t* l_types_ptr;
	char* l_type_name_ptr;
	uint32_t l_index;
	char l_error_message[201];

	GE_storable_in_read_natural_32(a_buffer, &nb, 1);
	if (nb <= 0) {
		snprintf(l_error_message, 200, "Independent retrieve: negative number of object type elements: %d", nb);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	if (nb == 1) {
		/* The type is not encoded if nb=1. */
		l_index = (a_object->flags & GE_STORABLE_EO_TYPE);
		if (l_index < 0 || l_index > a_data->maximum_class_index) {
			snprintf(l_error_message, 200, "Independent retrieve: invalid class index %d in object type", l_index);
			GE_raise_with_message(GE_EX_RETR, l_error_message);
		}
		l_class = a_data->classes[l_index];
		if (!l_class || !l_class->name) {
			snprintf(l_error_message, 200, "Independent retrieve: unknown class name for class index %d in object type", l_index);
			GE_raise_with_message(GE_EX_RETR, l_error_message);
		}
		l_type_name = l_class->name;
	} else {
		l_types = (int32_t*)GE_malloc_atomic((nb + 1) * sizeof(int32_t));
		GE_storable_in_read_integer_32(a_buffer, l_types, nb);
		l_types[nb] = GE_STORABLE_TYPE_TERMINATOR;
		/* Compute the number of characters needed to build the type name. */
		for (i = 0; i < nb; i++) {
			l_type = l_types[i];
			if ((l_type & (GE_STORABLE_MAX_DTYPE | ~GE_STORABLE_ANNOTATION_MASK)) == GE_STORABLE_MAX_DTYPE) {
				/* Type annotation. */
				if ((l_type & GE_STORABLE_ATTACHED_FLAG) == GE_STORABLE_ATTACHED_FLAG) {
					nb_char++;
				}
			} else if (l_type == GE_STORABLE_NONE_TYPE) {
				nb_char += 7;
			} else if (l_type == GE_STORABLE_TUPLE_TYPE) {
				nb_char += 8;
				/* Skip the number of actual generic parameter and the class index of class TUPLE. */
				i += 2;
			} else if (l_type > GE_STORABLE_MAX_DTYPE) {
				/* This is not a class id. */
			} else if (l_type < 0 || l_type > a_data->maximum_class_index) {
				snprintf(l_error_message, 200, "Independent retrieve: invalid class index %d in object type", l_type);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			} else {
				l_class = a_data->classes[l_type];
				if (!l_class || !l_class->name) {
					snprintf(l_error_message, 200, "Independent retrieve: unknown class name for class index %d in object type", l_type);
					GE_raise_with_message(GE_EX_RETR, l_error_message);
				} else {
					nb_char += strlen(l_class->name) + 3;
				}
			}
		}
		if (nb_char == 0) {
			GE_raise_with_message(GE_EX_RETR, "Independent retrieve: no type name for object type");
		}
		l_type_name = (char*)GE_calloc_atomic(nb_char + 1, sizeof(char));
		l_types_ptr = l_types;
		l_type_name_ptr = l_type_name;
		GE_storable_in_resolve_object_type(a_buffer, a_data, a_object, &l_types_ptr, &l_type_name_ptr);
		GE_free(l_types);
	}
	a_object->type_id = GE_storable_in_type_id_from_name(l_type_name);
	if (a_object->type_id <= 0) {
		snprintf(l_error_message, 200, "Independent retrieve: object type '%s' not in current system", l_type_name);
		if (nb_char) {
			GE_free(l_type_name);
		}
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	}
	if (nb_char) {
		GE_free(l_type_name);
	}
}

static void GE_storable_in_resolve_object_type(GE_storable_in_buffer* a_buffer, GE_storable_in_data* a_data, GE_storable_in_object* a_object, int32_t** volatile a_types_ptr, char** volatile a_type_name_ptr)
{
	GE_storable_in_class* l_class;
	int16_t nb_gen = 0;
	int16_t i;
	char l_error_message[101];

	if (**a_types_ptr == GE_STORABLE_TYPE_TERMINATOR) {
		GE_raise_with_message(GE_EX_RETR, "Independent retrieve: missing type elements in object type");
	} else if ((**a_types_ptr & (GE_STORABLE_MAX_DTYPE | ~GE_STORABLE_ANNOTATION_MASK)) == GE_STORABLE_MAX_DTYPE) {
		/* Type annotation. */
		if ((**a_types_ptr & GE_STORABLE_ATTACHED_FLAG) == GE_STORABLE_ATTACHED_FLAG) {
			**a_type_name_ptr = '!';
			(*a_type_name_ptr)++;
		}
		/* TODO: separate */
		(*a_types_ptr)++;
		GE_storable_in_resolve_object_type(a_buffer, a_data, a_object, a_types_ptr, a_type_name_ptr);
	} else if (**a_types_ptr == GE_STORABLE_NONE_TYPE) {
		strcpy(*a_type_name_ptr, "NONE");
		*a_type_name_ptr += 4;
		(*a_types_ptr)++;
	} else if (**a_types_ptr == GE_STORABLE_TUPLE_TYPE) {
		strcpy(*a_type_name_ptr, "TUPLE");
		*a_type_name_ptr += 5;
		(*a_types_ptr)++;
		/* Read number of actual generic parameters. */
		if (**a_types_ptr == GE_STORABLE_TYPE_TERMINATOR) {
			GE_raise_with_message(GE_EX_RETR, "Independent retrieve: missing number of generic parameters for TUPLE in object type");
		}
		nb_gen = **a_types_ptr;
		if (nb_gen < 0) {
			snprintf(l_error_message, 100, "Independent retrieve: negative number of generic parameters for TUPLE in object type: %d", nb_gen);
			GE_raise_with_message(GE_EX_RETR, l_error_message);
		}
		(*a_types_ptr)++;
		/* Skip the class index of class TUPLE. */
		if (**a_types_ptr == GE_STORABLE_TYPE_TERMINATOR) {
			GE_raise_with_message(GE_EX_RETR, "Independent retrieve: missing TUPLE class index in object type");
		}
		(*a_types_ptr)++;
	} else if (**a_types_ptr > GE_STORABLE_MAX_DTYPE) {
		/* This is not a class id. */
		(*a_types_ptr)++;
		GE_storable_in_resolve_object_type(a_buffer, a_data, a_object, a_types_ptr, a_type_name_ptr);
	} else if (**a_types_ptr < 0 || **a_types_ptr > a_data->maximum_class_index) {
		snprintf(l_error_message, 100, "Independent retrieve: invalid class index %d in object type", **a_types_ptr);
		GE_raise_with_message(GE_EX_RETR, l_error_message);
	} else {
		l_class = a_data->classes[**a_types_ptr];
		if (!l_class || !l_class->name) {
			snprintf(l_error_message, 100, "Independent retrieve: unknown class name for class index %d in object type", **a_types_ptr);
			GE_raise_with_message(GE_EX_RETR, l_error_message);
		} else {
			strcpy(*a_type_name_ptr, l_class->name);
			*a_type_name_ptr += strlen(l_class->name);
			(*a_types_ptr)++;
		}
		nb_gen = l_class->formal_parameter_count;
	}
	if (nb_gen) {
		strcpy(*a_type_name_ptr, " [");
		*a_type_name_ptr += 2;
		for (i = 0; i < nb_gen; i++) {
			GE_storable_in_resolve_object_type(a_buffer, a_data, a_object, a_types_ptr, a_type_name_ptr);
			if (i < (nb_gen - 1)) {
				strcpy(*a_type_name_ptr, ", ");
				*a_type_name_ptr += 2;
			}
		}
		**a_type_name_ptr = ']';
		(*a_type_name_ptr)++;
	}
}

/*
 * Id of type whose name is `a_name'.
 * 0 if no such type.
 */
static EIF_TYPE_INDEX GE_storable_in_type_id_from_name(char* a_name)
{
#ifdef GE_USE_TYPE_NAME
	int i;
	const char* l_name;

	for (i = 1; i <= GE_type_info_count; i++) {
		l_name = GE_type_infos[i].name;
		if (strcmp(a_name, l_name + 1) == 0) {
			return (EIF_TYPE_INDEX)i;
		}
	}
#endif
	return 0;
}

/*
 * Try to resolve unresolved address `a_address' with `a_object' is the addresses match.
 * Return True if resolved.
 */
static int GE_storable_in_resolve_address(GE_storable_in_data* a_data, GE_storable_in_object* a_object, GE_storable_in_unresolved_address* a_address)
{
	char l_error_message[201];

	if (a_object->old_address == a_address->old_address) {
		if (!GE_type_in_dynamic_type_set(a_object->type_id, a_address->attribute->dynamic_type_set, a_address->attribute->dynamic_type_count)) {
			snprintf(l_error_message, 200, "Independent retrieve: dynamic type set of attribute `%s` in class %s does not include the object type in current system", a_address->attribute->name, a_address->class_name);
			GE_raise_with_message(GE_EX_RETR, l_error_message);
		}
		GE_set_reference_field_at(a_address->attribute->offset + a_address->special_index * sizeof(EIF_REFERENCE), a_address->object, a_address->physical_offset, a_object->object);
		return 1;
	}
	return 0;
}

/*
 * Resolve unresolved all addresses not resolved yet.
 */
static void GE_storable_in_resolve_all_addresses(GE_storable_in_data* a_data)
{
	int32_t l_object_count = a_data->object_count;
	GE_storable_in_object* l_objects = a_data->objects;
	int32_t i;
	int32_t j;
	GE_storable_in_object* l_object;
	GE_storable_in_unresolved_address* l_address;
	char l_error_message[201];

	for (i = 0; i < l_object_count; i++) {
		l_object = &(l_objects[i]);
		while (l_object->unresolved_address) {
			l_address = l_object->unresolved_address;
			for (j = i - 1; j >= 0; j--) {
				if (GE_storable_in_resolve_address(a_data, &(l_objects[j]), l_address)){
					l_object->unresolved_address = l_address->next;
					GE_free(l_address);
					l_address = 0;
					break;
				}
			}
			if (!l_address) {
				continue;
			}
			for (j = l_object_count - 1; j >= i; j--) {
				if (GE_storable_in_resolve_address(a_data, &(l_objects[j]), l_address)){
					l_object->unresolved_address = l_address->next;
					GE_free(l_address);
					l_address = 0;
					break;
				}
			}
			if (l_address) {
				/* Unable to resolve this address. */
				snprintf(l_error_message, 200, "Independent retrieve: unable to find the object for attribute `%s` in class %s", l_address->attribute->name, l_address->class_name);
				GE_raise_with_message(GE_EX_RETR, l_error_message);
			}
		}
	}
}

/*
 * Object retrieved fron Storable file `a_file_desc'.
 */
EIF_REFERENCE GE_storable_retrieved_from_file(EIF_INTEGER a_file_desc)
{
	GE_storable_in_buffer* l_buffer;
	EIF_REFERENCE l_object;

	l_buffer = GE_storable_in_new_buffer_from_file(GE_storable_read, a_file_desc);
	l_object = GE_storable_retrieved_from_buffer(l_buffer);
	GE_storable_in_free_buffer(l_buffer);
	return l_object;
}

#else

/*
 * Object retrieved fron Storable file `a_file_desc'.
 */
EIF_REFERENCE GE_storable_retrieved_from_file(EIF_INTEGER a_file_desc)
{
	GE_raise_with_message(GE_EX_RETR, "Independent retrieve: no information about attributes in current system");
	return 0;
}

#endif

#ifdef __cplusplus
}
#endif

#endif
