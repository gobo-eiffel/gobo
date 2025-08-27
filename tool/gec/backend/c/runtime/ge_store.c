/*
	description:

		"C functions used to implement Storable facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_STORE_C
#define GE_STORE_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_STORE_H
#include "ge_store.h"
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

#if defined(GE_USE_TYPE_GENERATOR) && defined(GE_USE_TYPE_GENERIC_PARAMETERS) && defined(GE_USE_ATTRIBUTES) && defined(GE_USE_ATTRIBUTE_NAME) && defined(GE_USE_ATTRIBUTE_TYPE_ID) && defined(GE_USE_ATTRIBUTE_STORABLE_TYPE_ID) && defined(GE_USE_ATTRIBUTE_OFFSET)

/* Convert a host byte order INTEGER_16 to big endian. */
static EIF_INTEGER_16 GE_integer_16_to_be(EIF_INTEGER_16 i)
{
#if BYTEORDER == 0x1234
		/* Convert little endian to big endian. */
	return ((i >> 8) & 0xFF) |
			((i << 8) & 0xFF00);
#else
	return i;
#endif
}

/* Convert a host byte order INTEGER_32 to big endian. */
static EIF_INTEGER_32 GE_integer_32_to_be(EIF_INTEGER_32 i)
{
#if BYTEORDER == 0x1234
		/* Convert little endian to big endian. */
	return ((i >> 24) & 0xFF) |
			((i >> 8) & 0xFF00) |
			((i << 8) & 0xFF0000) |
			((i << 24) & 0xFF000000);
#else
	return i;
#endif
}

/* Convert a host byte order real64 to little endian. */
static EIF_REAL_64 GE_real_64_to_le(EIF_REAL_64 r)
{
#if BYTEORDER == 0x4321
		/* Convert big endian to little endian. */
	EIF_REAL_64 le;
	char* l_le_buffer;
	char* l_be_buffer;
	int i;

	l_le_buffer = (char*)(&le);
	l_be_buffer = (char*)(&r);
	for (i = 0; i < 8; i++) {
		l_le_buffer[7 - i] = l_be_buffer[i];
	}
	return le;
#else
	return r;
#endif
}

/* Size of the buffer to store Storable objects (256 kB). */
#define GE_STORABLE_OUT_BUFFER_SIZE 262144L

/* Struct for Storable out buffer. */
typedef struct GE_storable_out_buffer_struct GE_storable_out_buffer;
struct GE_storable_out_buffer_struct {
	uint32_t count; /* Number of bytes in buffer. */
	uint32_t capacity; /* Maximum number of bytes in buffer. */
	char* bytes; /* Bytes in buffer. */
	int (*write_char)(GE_storable_out_buffer*, char*, int); /* Function to write the buffer. */
};

/* Struct for Storable out buffer with file descriptor. */
typedef struct {
	uint32_t count; /* Number of bytes in buffer. */
	uint32_t capacity; /* Maximum number of bytes in buffer. */
	char* bytes; /* Bytes in buffer. */
	int (*write_char)(GE_storable_out_buffer*, char*, int); /* Function to write the buffer. */
	int file_desc;
} GE_storable_out_buffer_from_file;

/*
 * Write `a_size' characters from `a_pointer' to the file attached to `a_buffer'.
 * Return the number of characters actually written.
 */
static int GE_storable_write(GE_storable_out_buffer* a_buffer, char* a_pointer, int a_size)
{
	return write(((GE_storable_out_buffer_from_file*)a_buffer)->file_desc, a_pointer, a_size);
}

/*
 * Create a new buffer to write Storable objects.
 */
static GE_storable_out_buffer* GE_storable_out_new_buffer(int (*write_char)(GE_storable_out_buffer*, char *, int))
{
	GE_storable_out_buffer* buffer;

	buffer = (GE_storable_out_buffer*)GE_malloc(sizeof(GE_storable_out_buffer));
	buffer->count = 0;
	buffer->capacity = GE_STORABLE_OUT_BUFFER_SIZE;
	buffer->bytes = (char*)GE_malloc_atomic(buffer->capacity);
	buffer->write_char = write_char;
	return buffer;
}

/*
 * Create a new buffer to write to Storable files.
 */
static GE_storable_out_buffer* GE_storable_out_new_buffer_from_file(int (*write_char)(GE_storable_out_buffer*, char *, int), int a_file_desc)
{
	GE_storable_out_buffer_from_file* buffer;

	buffer = (GE_storable_out_buffer_from_file*)GE_malloc(sizeof(GE_storable_out_buffer_from_file));
	buffer->count = 0;
	buffer->capacity = GE_STORABLE_OUT_BUFFER_SIZE;
	buffer->bytes = (char*)GE_malloc_atomic(buffer->capacity);
	buffer->write_char = write_char;
	buffer->file_desc = a_file_desc;
	return (GE_storable_out_buffer*)buffer;
}

/*
 * Flush `a_buffer'.
 */
static void GE_storable_out_flush_buffer(GE_storable_out_buffer* a_buffer)
{
	int32_t l_size;
	int l_bytes_written;
	long l_amount_left;
	register int l_part_written;
	register int l_total_written = 0;
	register char* l_ptr = a_buffer->bytes;

	l_size = GE_integer_32_to_be(a_buffer->count);
	l_bytes_written = a_buffer->write_char(a_buffer, (char*)(&l_size), sizeof(int32_t));
	if ((l_bytes_written < 0) || ((size_t)l_bytes_written < sizeof(int32_t))) {
		GE_raise_with_message(GE_EX_RETR, "Independent store: unable to write buffer size");
	}
	l_size = a_buffer->count;
	l_amount_left = l_size;
	while (l_total_written < l_size) {
		if ((l_part_written = a_buffer->write_char(a_buffer, l_ptr, l_amount_left)) <= 0) {
				/* If we write 0 byte, it means that we could not write to the file. */
			GE_raise_with_message(GE_EX_RETR, "Independent store: unable to write bytes from buffer");
		}
		l_total_written += l_part_written;
		l_ptr += l_part_written;
		l_amount_left -= l_part_written;
	}
	a_buffer->count = 0;
}

/*
 * Flush `a_buffer' if necessary.
 */
static void GE_storable_out_check_buffer_capacity(GE_storable_out_buffer* a_buffer, size_t a_size)
{
	if ((a_buffer->count + a_size) > a_buffer->capacity) {
		GE_storable_out_flush_buffer(a_buffer);
	}
}

/*
 * Write `a_num' CHARACTER_8 values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_character_8(GE_storable_out_buffer* a_buffer, EIF_CHARACTER_8* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_CHARACTER_8 l_value;

	while (a_num > i++) {
		GE_storable_out_check_buffer_capacity(a_buffer, sizeof(EIF_CHARACTER_8));
		l_value = *a_object++;
		memcpy(a_buffer->bytes + a_buffer->count, &l_value, sizeof(EIF_CHARACTER_8));
		a_buffer->count += sizeof(EIF_CHARACTER_8);
	}
}

/*
 * Write `a_num' BOOLEAN values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_boolean(GE_storable_out_buffer* a_buffer, EIF_BOOLEAN* a_object, size_t a_num)
{
	size_t i = 0;
	char l_value;

	/* Note: BOOLEANs as stored as chars. */
	while (a_num > i++) {
		GE_storable_out_check_buffer_capacity(a_buffer, sizeof(char));
		l_value = EIF_TEST(*a_object++);
		memcpy(a_buffer->bytes + a_buffer->count, &l_value, sizeof(char));
		a_buffer->count += sizeof(char);
	}
}

/*
 * Write `a_num' INTEGER_8 values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_integer_8(GE_storable_out_buffer* a_buffer, EIF_INTEGER_8* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_INTEGER_8 l_value;

	while (a_num > i++) {
		GE_storable_out_check_buffer_capacity(a_buffer, sizeof(EIF_INTEGER_8));
		l_value = *a_object++;
		memcpy(a_buffer->bytes + a_buffer->count, &l_value, sizeof(EIF_INTEGER_8));
		a_buffer->count += sizeof(EIF_INTEGER_8);
	}
}

/*
 * Write `a_num' NATURAL_8 values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_natural_8(GE_storable_out_buffer* a_buffer, EIF_NATURAL_8* a_object, size_t a_num)
{
	GE_storable_out_write_integer_8(a_buffer, (EIF_INTEGER_8*)a_object, a_num);
}

/*
 * Write `a_num' INTEGER_16 values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_integer_16(GE_storable_out_buffer* a_buffer, EIF_INTEGER_16* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_INTEGER_16 l_value;

	while (a_num > i++) {
		GE_storable_out_check_buffer_capacity(a_buffer, sizeof(EIF_INTEGER_16));
		l_value = (EIF_INTEGER_16)GE_integer_16_to_be(*a_object++);
		memcpy(a_buffer->bytes + a_buffer->count, &l_value, sizeof(EIF_INTEGER_16));
		a_buffer->count += sizeof(EIF_INTEGER_16);
	}
}

/*
 * Write `a_num' NATURAL_16 values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_natural_16(GE_storable_out_buffer* a_buffer, EIF_NATURAL_16* a_object, size_t a_num)
{
	GE_storable_out_write_integer_16(a_buffer, (EIF_INTEGER_16*)a_object, a_num);
}

/*
 * Write `a_num' INTEGER_32 values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_integer_32(GE_storable_out_buffer* a_buffer, EIF_INTEGER_32* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_INTEGER_32 l_value;

	while (a_num > i++) {
		GE_storable_out_check_buffer_capacity(a_buffer, sizeof(EIF_INTEGER_32));
		l_value = (EIF_INTEGER_32)GE_integer_32_to_be(*a_object++);
		memcpy(a_buffer->bytes + a_buffer->count, &l_value, sizeof(EIF_INTEGER_32));
		a_buffer->count += sizeof(EIF_INTEGER_32);
	}
}

/*
 * Write `a_num' NATURAL_32 values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_natural_32(GE_storable_out_buffer* a_buffer, EIF_NATURAL_32* a_object, size_t a_num)
{
	GE_storable_out_write_integer_32(a_buffer, (EIF_INTEGER_32*)a_object, a_num);
}

/*
 * Write `a_num' INTEGER_64 values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_integer_64(GE_storable_out_buffer* a_buffer, EIF_INTEGER_64* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_INTEGER_64 l_lower, l_upper;
	EIF_INTEGER_32 l_value;

	while (a_num > i++) {
		GE_storable_out_check_buffer_capacity(a_buffer, sizeof(EIF_INTEGER_64));
		/* Note: INTEGER_64s are stored as two INTEGER_32s,
		   first the lower part and then the upper part. */
		l_lower = (*a_object & GE_nat64(0x00000000FFFFFFFF));
		l_value = GE_integer_32_to_be((EIF_INTEGER_32)l_lower);
		memcpy(a_buffer->bytes + a_buffer->count, &l_value, sizeof(EIF_INTEGER_32));
		a_buffer->count += sizeof(EIF_INTEGER_32);
		l_upper = ((*a_object++ >> 32) & GE_nat64(0x00000000FFFFFFFF));
		l_value = GE_integer_32_to_be((EIF_INTEGER_32)l_upper);
		memcpy(a_buffer->bytes + a_buffer->count, &l_value, sizeof(EIF_INTEGER_32));
		a_buffer->count += sizeof(EIF_INTEGER_32);
	}
}

/*
 * Write `a_num' NATURAL_64 values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_natural_64(GE_storable_out_buffer* a_buffer, EIF_NATURAL_64* a_object, size_t a_num)
{
	GE_storable_out_write_integer_64(a_buffer, (EIF_INTEGER_64*)a_object, a_num);
}

/*
 * Write `a_num' CHARACTER_32 values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_character_32(GE_storable_out_buffer* a_buffer, EIF_CHARACTER_32* a_object, size_t a_num)
{
	GE_storable_out_write_integer_32(a_buffer, (EIF_INTEGER_32*)a_object, a_num);
}

/*
 * Write `a_num' REAL_64 values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_real_64(GE_storable_out_buffer* a_buffer, EIF_REAL_64* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_REAL_64 l_value;

	/* Note: REAL_64s are stored in little endian mode whereas
	   everything else is stored in big endian mode. */
	while (a_num > i++) {
		GE_storable_out_check_buffer_capacity(a_buffer, sizeof(EIF_REAL_64));
		l_value = GE_real_64_to_le(*a_object++);
		memcpy(a_buffer->bytes + a_buffer->count, &l_value, sizeof(EIF_REAL_64));
		a_buffer->count += sizeof(EIF_REAL_64);
	}
}

/*
 * Write `a_num' REAL_32 values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_real_32(GE_storable_out_buffer* a_buffer, EIF_REAL_32* a_object, size_t a_num)
{
	size_t i = 0;
	EIF_REAL_64 l_value;

	/* Note: REAL_32s are stored as REAL_64s. */
	while (a_num > i++) {
		l_value = (EIF_REAL_32)*a_object++;
		GE_storable_out_write_real_64(a_buffer, &l_value, 1);
	}
}

/*
 * Write `a_num' pointer values from `a_object' to `a_buffer'.
 */
static void GE_storable_out_write_pointer(GE_storable_out_buffer* a_buffer, uint64_t* a_object, size_t a_num)
{
	int8_t nb;

	/* First we write the number of bytes used to store a pointer value. */
	nb = 8;
	GE_storable_out_write_integer_8(a_buffer, &nb, 1);
	GE_storable_out_write_natural_64(a_buffer, a_object, a_num);
}
	
/*
 * Free memory allocated by `a_buffer'.
 */
static void GE_storable_out_free_buffer(GE_storable_out_buffer* a_buffer)
{
	GE_free(a_buffer->bytes);
	GE_free(a_buffer);
}

/* Struct for Storable objects. */
typedef struct GE_storable_out_object_struct GE_storable_out_object;

/* Struct for Storable classes/types. */
typedef struct {
	uint32_t flags; /* Class flags. */
	char* storable_version; /* Storable version of the class. */
	int16_t index; /* Index of class in the list of classes. */
	GE_type_info* type_info;
	GE_storable_out_object* objects; /* Objects of this class/type. */
} GE_storable_out_class;

/* Struct for Storable non-basic type attributes. */
typedef struct GE_storable_out_attribute_struct GE_storable_out_attribute;
struct GE_storable_out_attribute_struct {
	GE_storable_out_object* value;
	GE_storable_out_attribute* next; /* Next attribute in object. */
};

/* Struct for Storable objects. */
struct GE_storable_out_object_struct {
	void* object; /* Object. */
	uint32_t flags;
	char is_expanded; /* Is `object' expanded (and not boxed)? */
	char in_tuple; /* Is `object' an expanded field in a tuple? */
	uint64_t address; /* Address to be written to the Storable file. */
	GE_storable_out_attribute* attributes; /* Attributes' values. */
	int attributes_recorded; /* Have attributes been recorded? */
	GE_storable_out_class* class; /* Class/type of the object in the Storable file. */
	GE_storable_out_object* next_in_list; /* Next object in the list of objects to be written to the Storable file. */
	GE_storable_out_object* next_in_class; /* Next object with the same class/type. */
};

/* Struct for Storable data. */
typedef struct {
	int16_t class_count; /* Number of classes. */
	GE_storable_out_class** classes; /* Classes in schema. */
	int32_t object_count; /* Number of objects.*/
	GE_storable_out_object* objects; /* Objects. */
} GE_storable_out_data;

/*
 * New data.
 */
static GE_storable_out_data* GE_storable_out_new_data()
{
	GE_storable_out_data* l_data;

	l_data = (GE_storable_out_data*)GE_malloc(sizeof(GE_storable_out_data));
	l_data->class_count = 0;
	l_data->classes = (GE_storable_out_class**)GE_calloc(GE_type_info_count + 1, sizeof(GE_storable_out_class*));
	l_data->object_count = 0;
	l_data->objects= 0;
	return l_data;
}

/*
 * Free memory allocated by `a_data'.
 */
static void GE_storable_out_free_data(GE_storable_out_data* a_data)
{
	GE_storable_out_object* l_object;
	GE_storable_out_object* l_next_object;
	GE_storable_out_attribute* l_attribute;
	GE_storable_out_attribute* l_next_attribute;
	GE_storable_out_class* l_class;
	uint32_t i, nb;

	l_object = a_data->objects;
	while (l_object) {
		l_attribute = l_object->attributes;
		while (l_attribute) {
			l_next_attribute = l_attribute->next;
			GE_free(l_attribute);
			l_attribute = l_next_attribute;
		}
		l_next_object = l_object->next_in_list;
		GE_free(l_object);
		l_object = l_next_object;
	}
	nb = GE_type_info_count + 1;
	for (i = 0; i < nb; i++) {
		l_class = a_data->classes[i];
		if (l_class) {
			GE_free(l_class);
		}
	}
	GE_free(a_data->classes);
	GE_free(a_data);
}

static void GE_storable_out_write_object(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, GE_storable_out_object* a_object);
static void GE_storable_out_write_subobject(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, GE_storable_out_object* a_object);

/*
 * Record class fpr type `a_type_id' to `a_data'.
 * Return the recorded class.
 */
static GE_storable_out_class* GE_storable_out_record_class(EIF_TYPE_INDEX a_type_id, int a_with_reference_generic_types, int a_with_attribute_types, GE_storable_out_data* a_data)
{
	GE_storable_out_class* l_class;
	GE_type_info* l_type_info;
	uint32_t i, nb;
	EIF_TYPE_INDEX l_other_type_id;
	GE_attribute* l_attribute;

	l_type_info = &GE_type_infos[a_type_id];
	l_class = a_data->classes[a_type_id];
	if (!l_class) {
		l_class = (GE_storable_out_class*)GE_calloc(1, sizeof(GE_storable_out_class));
		l_class->type_info = l_type_info;
		a_data->classes[a_type_id] = l_class;
		a_data->class_count++;
		if (l_type_info->flags & GE_TYPE_FLAG_EXPANDED) {
			l_class->flags |= (GE_STORABLE_CLASS_IS_EXPANDED_FLAG | GE_STORABLE_CLASS_IS_DECLARED_EXPANDED_FLAG);
		}
		nb = l_type_info->generic_parameter_count;
		for (i = 0; i < nb; i++) {
			l_other_type_id = GE_decoded_type(l_type_info->generic_parameters[i]).id;
			if (GE_type_infos[l_other_type_id].flags & GE_TYPE_FLAG_EXPANDED) {
				GE_storable_out_record_class(l_other_type_id, a_with_reference_generic_types, 0, a_data);
			}
		}
	}
	if (a_with_reference_generic_types) {
		nb = l_type_info->generic_parameter_count;
		for (i = 0; i < nb; i++) {
			l_other_type_id = GE_decoded_type(l_type_info->generic_parameters[i]).id;
			if (!(GE_type_infos[l_other_type_id].flags & GE_TYPE_FLAG_EXPANDED)) {
				GE_storable_out_record_class(l_other_type_id, a_with_reference_generic_types, 0, a_data);
			}
		}
	}
	if (a_with_attribute_types && !(l_class->objects)) {
		nb = l_type_info->attribute_count;
		for (i = 0; i < nb; i++) {
			l_attribute = l_type_info->attributes[i];
			l_other_type_id = GE_decoded_type(l_attribute->storable_type_id).id;
			if (!(GE_type_infos[l_other_type_id].flags & GE_TYPE_FLAG_FORMAL)) {
				l_other_type_id = GE_decoded_type(l_attribute->type_id).id;
				GE_storable_out_record_class(l_other_type_id, 1, 0, a_data);
			}
		}
	}
	return l_class;
}

/*
 * Record `a_object' to `a_data'.
 * Return the recorded object.
 */
static GE_storable_out_object* GE_storable_out_record_object(void* a_object, EIF_TYPE_INDEX a_type_id, int a_is_expanded, int a_in_tuple, GE_storable_out_data* a_data)
{
	GE_storable_out_class* l_class;
	GE_storable_out_object* l_object;

	l_class = GE_storable_out_record_class(a_type_id, 0, 1, a_data);
	if (!(l_class->type_info->flags & GE_TYPE_FLAG_EXPANDED)) {
		l_object = l_class->objects;
		while (l_object) {
			if (l_object->object == a_object) {
				return l_object;
			} else {
				l_object = l_object->next_in_class;
			}
		}
	}
	l_object = (GE_storable_out_object*)GE_calloc(1, sizeof(GE_storable_out_object));
	l_object->object = a_object;
	l_object->class = l_class;
	l_object->is_expanded = a_is_expanded;
	l_object->in_tuple = a_in_tuple;
	if (l_class->type_info->flags & GE_TYPE_FLAG_EXPANDED) {
		l_object->flags |= GE_STORABLE_EO_EXP;
	}
	l_object->next_in_list = a_data->objects;
	a_data->objects = l_object;
	if (!a_is_expanded || a_in_tuple) {
		a_data->object_count++;
	}
	l_object->next_in_class = l_class->objects;
	l_class->objects = l_object;
	return l_object;
}

/*
 * Record reference `a_object' to `a_data'.
 * Return the recorded object.
 */
static GE_storable_out_object* GE_storable_out_record_reference_object(EIF_REFERENCE a_object, GE_storable_out_data* a_data)
{
	return GE_storable_out_record_object((void*)a_object, a_object->id, 0, 0, a_data);
}

/*
 * Record attributes of special object `a_object' to `a_data'.
 */
static void GE_storable_out_record_special_attributes(GE_storable_out_object* a_object, GE_storable_out_data* a_data)
{
	GE_type_info* l_type_info;
	uint32_t i, nb;
	uint32_t l_item_offset;
	uint32_t l_item_size;
	uint16_t l_item_flags;
	EIF_TYPE_INDEX l_item_type_id;
	GE_attribute* l_runtime_attribute;
	GE_storable_out_attribute* l_attribute;
	GE_storable_out_object* l_object;
	EIF_REFERENCE l_ref;
	EIF_SPECIAL* l_special;

	l_type_info = a_object->class->type_info;
	a_object->flags |= GE_STORABLE_EO_SPEC;
	/* Note: the third attribute is for the item offset. */
	l_runtime_attribute = l_type_info->attributes[2];
	l_item_type_id = GE_decoded_type(l_runtime_attribute->type_id).id;
	l_item_flags = GE_type_infos[l_item_type_id].flags;
	if (!(l_item_flags & GE_TYPE_FLAG_EXPANDED)) {
		a_object->flags |= GE_STORABLE_EO_REF;
		l_special = (EIF_SPECIAL*)a_object->object;
		l_item_offset = l_runtime_attribute->offset;
		l_item_size = l_runtime_attribute->size;
		nb = l_special->count;
		for (i = nb; i > 0; i--) {
			l_ref = GE_reference_field_at(l_item_offset + (i - 1) * l_item_size, l_special, 0);
			if (l_ref) {
				l_object = GE_storable_out_record_reference_object(l_ref, a_data);
				l_attribute = (GE_storable_out_attribute*)GE_calloc(1, sizeof(GE_storable_out_attribute));
				l_attribute->value = l_object;
				l_attribute->next = a_object->attributes;
				a_object->attributes = l_attribute;
			}
		}
	} else if (l_item_flags & GE_TYPE_FLAG_BASIC_MASK) {
		/* Skip. */
	} else {
		/* Non-basic expanded type. */
		a_object->flags |= (GE_STORABLE_EO_REF | GE_STORABLE_EO_COMP);
		a_object->class->flags |= GE_STORABLE_CLASS_IS_COMPOSITE_FLAG;
		l_special = (EIF_SPECIAL*)a_object->object;
		l_item_offset = l_runtime_attribute->offset;
		l_object = GE_storable_out_record_object((void*)GE_field_address_at(l_item_offset, l_special, 0), l_item_type_id, 1, 0, a_data);
		l_attribute = (GE_storable_out_attribute*)GE_calloc(1, sizeof(GE_storable_out_attribute));
		l_attribute->value = l_object;
		l_attribute->next = a_object->attributes;
		a_object->attributes = l_attribute;
	}
	a_object->attributes_recorded = 1;
}

/*
 * Record attributes of tuple object `a_object' to `a_data'.
 */
static void GE_storable_out_record_tuple_attributes(GE_storable_out_object* a_object, GE_storable_out_data* a_data)
{
	GE_type_info* l_type_info;
	uint32_t i, nb;
	EIF_TYPE_INDEX l_runtime_type;
	GE_attribute* l_runtime_attribute;
	GE_storable_out_attribute* l_attribute;
	GE_storable_out_object* l_object;
	EIF_REFERENCE l_ref;
	uint16_t l_flags;
	void* l_enclosing_object;

	l_type_info = a_object->class->type_info;
	a_object->flags |= GE_STORABLE_EO_TUPLE;
	a_object->flags |= GE_STORABLE_EO_SPEC;
	l_enclosing_object = a_object->object;
	nb = l_type_info->attribute_count;
	for (i = nb; i > 0; i--) {
		l_runtime_attribute = l_type_info->attributes[i - 1];
		l_runtime_type = GE_decoded_type(l_runtime_attribute->type_id).id;
		l_flags = GE_type_infos[l_runtime_type].flags;
		if (!(l_flags & GE_TYPE_FLAG_EXPANDED)) {
			a_object->flags |= GE_STORABLE_EO_REF;
			l_ref = GE_reference_field_at(l_runtime_attribute->offset, l_enclosing_object, 0);
			if (l_ref) {
				l_object = GE_storable_out_record_reference_object(l_ref, a_data);
				l_attribute = (GE_storable_out_attribute*)GE_calloc(1, sizeof(GE_storable_out_attribute));
				l_attribute->value = l_object;
				l_attribute->next = a_object->attributes;
				a_object->attributes = l_attribute;
			}
		} else if (l_flags & GE_TYPE_FLAG_BASIC_MASK) {
			/* Skip. */
		} else {
			a_object->flags |= (GE_STORABLE_EO_REF | GE_STORABLE_EO_COMP);
			a_object->class->flags |= GE_STORABLE_CLASS_IS_COMPOSITE_FLAG;
			l_object = GE_storable_out_record_object((void*)GE_field_address_at(l_runtime_attribute->offset, l_enclosing_object, 0), l_runtime_type, 1, 1, a_data);
			l_attribute = (GE_storable_out_attribute*)GE_calloc(1, sizeof(GE_storable_out_attribute));
			l_attribute->value = l_object;
			l_attribute->next = a_object->attributes;
			a_object->attributes = l_attribute;
		}
	}
	a_object->attributes_recorded = 1;
}

/*
 * Record attributes of regular object `a_object' to `a_data'.
 */
static void GE_storable_out_record_regular_attributes(GE_storable_out_object* a_object, GE_storable_out_data* a_data)
{
	GE_type_info* l_type_info;
	uint32_t i, nb;
	EIF_TYPE_INDEX l_runtime_type;
	GE_attribute* l_runtime_attribute;
	GE_storable_out_attribute* l_attribute;
	uint32_t l_physical_offset = 0;
	GE_storable_out_object* l_object;
	EIF_REFERENCE l_ref;
	uint16_t l_flags;
	void* l_enclosing_object;

	l_type_info = a_object->class->type_info;
	if ((l_type_info->flags & GE_TYPE_FLAG_EXPANDED) && !(l_type_info->flags & GE_TYPE_FLAG_BASIC_MASK) && !a_object->is_expanded) {
		/* This is a boxed non-basic expanded object. */
		l_physical_offset = l_type_info->attributes[l_type_info->attribute_count]->offset;
	}
	l_enclosing_object = a_object->object;
	nb = l_type_info->attribute_count;
	for (i = 0; i < nb; i++) {
		l_runtime_attribute = l_type_info->attributes[i];
		l_runtime_type = GE_decoded_type(l_runtime_attribute->type_id).id;
		l_flags = GE_type_infos[l_runtime_type].flags;
		if (!(l_flags & GE_TYPE_FLAG_EXPANDED)) {
			a_object->flags |= GE_STORABLE_EO_REF;
			l_ref = GE_reference_field_at(l_runtime_attribute->offset, l_enclosing_object, l_physical_offset);
			if (l_ref) {
				l_object = GE_storable_out_record_reference_object(l_ref, a_data);
				l_attribute = (GE_storable_out_attribute*)GE_calloc(1, sizeof(GE_storable_out_attribute));
				l_attribute->value = l_object;
				/* Note: attributes are stored in reverse order in the Storable file. */
				l_attribute->next = a_object->attributes;
				a_object->attributes = l_attribute;
			}
		} else if (l_flags & GE_TYPE_FLAG_BASIC_MASK) {
			/* Skip. */
		} else {
			a_object->flags |= (GE_STORABLE_EO_REF | GE_STORABLE_EO_COMP);
			a_object->class->flags |= GE_STORABLE_CLASS_IS_COMPOSITE_FLAG;
			l_object = GE_storable_out_record_object((void*)GE_field_address_at(l_runtime_attribute->offset, l_enclosing_object, l_physical_offset), l_runtime_type, 1, 0, a_data);
			l_attribute = (GE_storable_out_attribute*)GE_calloc(1, sizeof(GE_storable_out_attribute));
			l_attribute->value = l_object;
			/* Note: attributes are stored in reverse order in the Storable file. */
			l_attribute->next = a_object->attributes;
			a_object->attributes = l_attribute;
		}
	}
	a_object->attributes_recorded = 1;
}

/*
 * Record attributes of `a_object' to `a_data'.
 */
static void GE_storable_out_record_attributes(GE_storable_out_object* a_object, GE_storable_out_data* a_data)
{
	GE_type_info* l_type_info;

	l_type_info = a_object->class->type_info;
	if (l_type_info->flags & GE_TYPE_FLAG_SPECIAL) {
		GE_storable_out_record_special_attributes(a_object, a_data);
	} else if (l_type_info->flags & GE_TYPE_FLAG_TUPLE) {
		GE_storable_out_record_tuple_attributes(a_object, a_data);
	} else {
		GE_storable_out_record_regular_attributes(a_object, a_data);
	}
}

/*
 * Record objects to be stored.
 */
static void GE_storable_out_record_objects(EIF_REFERENCE a_root_object, GE_storable_out_data* a_data)
{
	GE_storable_out_object* l_object;
	uint64_t i, j;
	uint64_t l_address;

	l_object = GE_storable_out_record_reference_object(a_root_object, a_data);
	while(l_object && !(l_object->attributes_recorded)) {
		while(l_object && !(l_object->attributes_recorded)) {
			GE_storable_out_record_attributes(l_object, a_data);
			l_object = l_object->next_in_list;
		}
		l_object = a_data->objects;
	}
	i = 1;
	j = a_data->object_count + 1;
	l_object = a_data->objects;
	while (l_object) {
		if (!(l_object->is_expanded) || l_object->in_tuple) {
			l_address = i | 0x00000000F0000000;
			i++;
		} else {
			l_address = j | 0x00000000F0000000;
			j++;
		}
		l_object->address = l_address;
		l_object = l_object->next_in_list;
	}
}

/*
 * Write formal generic parameters of `a_class' description' to Storable buffer `a_buffer'.
 */
static void GE_storable_out_write_formal_generic_parameters(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, GE_storable_out_class* a_class)
{
	GE_type_info* l_type_info;
	int16_t i, nb;
	EIF_TYPE_INDEX l_type_id;
	uint16_t l_flags;
	uint32_t l_gen_type;

	l_type_info = a_class->type_info;
	if (!(l_type_info->flags & GE_TYPE_FLAG_TUPLE)) {
		nb = l_type_info->generic_parameter_count;
	} else {
		nb = 0;
	}
	GE_storable_out_write_integer_16(a_buffer, &nb, 1);
	for (i = 0; i < nb; i++) {
		l_type_id = GE_decoded_type(l_type_info->generic_parameters[i]).id;
		l_flags = GE_type_infos[l_type_id].flags;
		if (!(l_flags & GE_TYPE_FLAG_EXPANDED)) {
			l_gen_type = GE_STORABLE_SK32_REF;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_BOOLEAN) {
			l_gen_type = GE_STORABLE_SK32_BOOL;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_CHARACTER_8) {
			l_gen_type = GE_STORABLE_SK32_CHAR8;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_CHARACTER_32) {
			l_gen_type = GE_STORABLE_SK32_CHAR32;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_8) {
			l_gen_type = GE_STORABLE_SK32_INT8;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_16) {
			l_gen_type = GE_STORABLE_SK32_INT16;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_32) {
			l_gen_type = GE_STORABLE_SK32_INT32;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_64) {
			l_gen_type = GE_STORABLE_SK32_INT64;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_8) {
			l_gen_type = GE_STORABLE_SK32_UINT8;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_16) {
			l_gen_type = GE_STORABLE_SK32_UINT16;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_32) {
			l_gen_type = GE_STORABLE_SK32_UINT32;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_64) {
			l_gen_type = GE_STORABLE_SK32_UINT64;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_REAL_32) {
			l_gen_type = GE_STORABLE_SK32_REAL32;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_REAL_64) {
			l_gen_type = GE_STORABLE_SK32_REAL64;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_POINTER) {
			l_gen_type = GE_STORABLE_SK32_POINTER;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		} else {
			/* Non-basic expanded type. */
			l_gen_type = a_data->classes[l_type_id]->index;
			l_gen_type = (l_gen_type & GE_STORABLE_SK32_DTYPE) | GE_STORABLE_SK32_EXP;
			GE_storable_out_write_natural_32(a_buffer, &l_gen_type, 1);
		}
	}
}

/*
 * Write attribute type `a_type' to Storable buffer `a_buffer' if the buffer is not null.
 * Return the number of type elements written (or to be written).
 */
static int16_t GE_storable_out_write_attribute_type(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, EIF_TYPE a_type, EIF_TYPE a_type_with_formals)
{
	EIF_TYPE_INDEX l_annotations;
	GE_type_info* l_type_info;
	GE_type_info* l_type_info_with_formals;
	uint16_t l_flags;
	int16_t l_count = 0;
	int16_t l_gen_type;
	uint32_t i, nb;

	l_type_info = &GE_type_infos[a_type.id];
	l_type_info_with_formals = &GE_type_infos[a_type_with_formals.id];
	l_annotations = a_type_with_formals.annotations;
	if (l_annotations) {
		if (a_buffer) {
			l_gen_type = l_annotations | GE_STORABLE_MAX_DTYPE;
			GE_storable_out_write_integer_16(a_buffer, &l_gen_type, 1);
		}
		l_count++;
	}
	l_flags = l_type_info_with_formals->flags;
	if (l_flags & GE_TYPE_FLAG_TUPLE) {
		if (a_buffer) {
			l_gen_type = GE_STORABLE_TUPLE_TYPE;
			GE_storable_out_write_integer_16(a_buffer, &l_gen_type, 1);
			l_gen_type = l_type_info->generic_parameter_count;
			GE_storable_out_write_integer_16(a_buffer, &l_gen_type, 1);
			l_gen_type = a_data->classes[a_type.id]->index;
			GE_storable_out_write_integer_16(a_buffer, &l_gen_type, 1);
		}
		l_count += 3;
	} else if (l_flags & GE_TYPE_FLAG_NONE) {
		l_gen_type = GE_STORABLE_NONE_TYPE;
		if (a_buffer) GE_storable_out_write_integer_16(a_buffer, &l_gen_type, 1);
		l_count++;
	} else if (l_flags & GE_TYPE_FLAG_FORMAL) {
		if (a_buffer) {
			l_gen_type = GE_STORABLE_FORMAL_TYPE;
			GE_storable_out_write_integer_16(a_buffer, &l_gen_type, 1);
			/* The class name is of the form "G#1", "G#2", etc. */
			sscanf(l_type_info_with_formals->generator + 2, "%hd", &l_gen_type);
			GE_storable_out_write_integer_16(a_buffer, &l_gen_type, 1);
		}
		l_count += 2;
	} else {
		l_gen_type = a_data->classes[a_type.id]->index;
		if (a_buffer) GE_storable_out_write_integer_16(a_buffer, &l_gen_type, 1);
		l_count++;
	}
	nb = l_type_info_with_formals->generic_parameter_count;
	for (i = 0; i < nb; i++) {
		l_count += GE_storable_out_write_attribute_type(a_buffer, a_data, GE_decoded_type(l_type_info->generic_parameters[i]), GE_decoded_type(l_type_info_with_formals->generic_parameters[i]));
	}
	return l_count;
}

/*
 * Write attribute description to Storable buffer `a_buffer'.
 */
static void GE_storable_out_write_attribute(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, GE_storable_out_class* a_class, GE_attribute* a_attribute)
{
	const char* l_name;
	int16_t nb;
	EIF_TYPE l_type;
	EIF_TYPE l_type_with_formals;
	uint16_t l_flags;
	uint8_t l_type_kind;
	int16_t l_count;

	l_name = a_attribute->name;
	nb = strlen(l_name);
	GE_storable_out_write_integer_16(a_buffer, &nb, 1);
	GE_storable_out_write_character_8(a_buffer, (EIF_CHARACTER_8*)l_name, nb);
	l_type = GE_decoded_type(a_attribute->type_id);
	l_flags = GE_type_infos[l_type.id].flags;
	if (!(l_flags & GE_TYPE_FLAG_EXPANDED)) {
		l_type_kind = GE_STORABLE_SK_REF;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_BOOLEAN) {
		l_type_kind = GE_STORABLE_SK_BOOL;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_CHARACTER_8) {
		l_type_kind = GE_STORABLE_SK_CHAR8;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_CHARACTER_32) {
		l_type_kind = GE_STORABLE_SK_CHAR32;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_8) {
		l_type_kind = GE_STORABLE_SK_INT8;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_16) {
		l_type_kind = GE_STORABLE_SK_INT16;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_32) {
		l_type_kind = GE_STORABLE_SK_INT32;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_64) {
		l_type_kind = GE_STORABLE_SK_INT64;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_8) {
		l_type_kind = GE_STORABLE_SK_UINT8;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_16) {
		l_type_kind = GE_STORABLE_SK_UINT16;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_32) {
		l_type_kind = GE_STORABLE_SK_UINT32;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_64) {
		l_type_kind = GE_STORABLE_SK_UINT64;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_REAL_32) {
		l_type_kind = GE_STORABLE_SK_REAL32;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_REAL_64) {
		l_type_kind = GE_STORABLE_SK_REAL64;
	} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_POINTER) {
		l_type_kind = GE_STORABLE_SK_POINTER;
	} else {
		/* Non-basic expanded type. */
		l_type_kind = GE_STORABLE_SK_EXP;
	}
	GE_storable_out_write_natural_8(a_buffer, &l_type_kind, 1);
	l_type_with_formals = GE_decoded_type(a_attribute->storable_type_id);
	l_count = GE_storable_out_write_attribute_type(0, a_data, l_type, l_type_with_formals);
	GE_storable_out_write_integer_16(a_buffer, &l_count, 1);
	GE_storable_out_write_attribute_type(a_buffer, a_data, l_type, l_type_with_formals);
}

/*
 * Write class description to Storable buffer `a_buffer'.
 */
static void GE_storable_out_write_class(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, GE_storable_out_class* a_class)
{
	GE_type_info* l_type_info;
	const char* l_name;
	int16_t i, nb;
	uint32_t nb32;

	l_type_info = a_class->type_info;
	/* Write class name. */
	l_name = l_type_info->generator;
	nb = strlen(l_name);
	GE_storable_out_write_integer_16(a_buffer, &nb, 1);
	GE_storable_out_write_character_8(a_buffer, (EIF_CHARACTER_8*)l_name, nb);
	GE_storable_out_write_natural_32(a_buffer, &(a_class->flags), 1);
	GE_storable_out_write_integer_16(a_buffer, &(a_class->index), 1);
	/* Write storable version. */
	l_name = a_class->storable_version;
	if (l_name) {
		nb32 = strlen(l_name);
		GE_storable_out_write_natural_32(a_buffer, &nb32, 1);
		GE_storable_out_write_character_8(a_buffer, (EIF_CHARACTER_8*)l_name, nb32);
	} else {
		nb32 = 0;
		GE_storable_out_write_natural_32(a_buffer, &nb32, 1);
	}
	GE_storable_out_write_formal_generic_parameters(a_buffer, a_data, a_class);
	/* Write attributes. */
	if (a_class->objects && !(l_type_info->flags & GE_TYPE_FLAG_TUPLE) && !(l_type_info->flags & GE_TYPE_FLAG_SPECIAL)) {
		nb = l_type_info->attribute_count;
	} else {
		nb = 0;
	}
	GE_storable_out_write_integer_16(a_buffer, &nb, 1);
	for (i = 0; i < nb; i++) {
		GE_storable_out_write_attribute(a_buffer, a_data, a_class, l_type_info->attributes[i]);
	}
}

/*
 * Write class descriptions to Storable buffer `a_buffer'.
 */
static void GE_storable_out_write_classes(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data)
{
	int16_t i, nb;
	GE_storable_out_class* l_class;
	int16_t l_maximum_class_index;
	int16_t l_last_class_index;
	int j = 0;

	nb = a_data->class_count;
	l_maximum_class_index = 0;
	l_class = a_data->classes[0];
	for (i = 0; i < nb; i++) {
		while (!l_class) {
			l_class = a_data->classes[++j];
		}
		l_maximum_class_index++;
		l_class->index = l_maximum_class_index;
		l_class = a_data->classes[++j];
	}
	GE_storable_out_write_integer_16(a_buffer, &l_maximum_class_index, 1);
	GE_storable_out_write_integer_16(a_buffer, &(a_data->class_count), 1);
	l_class = a_data->classes[0];
	l_last_class_index = 0;
	j = 0;
	while (l_last_class_index < l_maximum_class_index) {
		while (!l_class) {
			l_class = a_data->classes[++j];
		}
		if (l_class->index > l_last_class_index) {
			l_last_class_index = l_class->index;
			GE_storable_out_write_class(a_buffer, a_data, l_class);
		}
		l_class = a_data->classes[++j];
	}
}

/*
 * Write object type `a_type' to Storable buffer `a_buffer' if the buffer is not null.
 * Return the number of type elements written (or to be written).
 */
static uint32_t GE_storable_out_write_object_subtype(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, EIF_TYPE a_type)
{
	EIF_TYPE_INDEX l_type_id;
	EIF_TYPE_INDEX l_annotations;
	GE_type_info* l_type_info;
	uint16_t l_flags;
	uint32_t l_count = 0;
	int32_t l_gen_type = 0;
	uint32_t i, nb;

	l_annotations = a_type.annotations;
	if (l_annotations) {
		if (a_buffer) {
			l_gen_type |= l_annotations | GE_STORABLE_MAX_DTYPE;
			GE_storable_out_write_integer_32(a_buffer, &l_gen_type, 1);
		}
		l_count++;
	}
	l_type_id = a_type.id;
	l_type_info = &GE_type_infos[l_type_id];
	l_flags = l_type_info->flags;
	if (l_type_info->flags & GE_TYPE_FLAG_TUPLE) {
		if (a_buffer) {
			l_gen_type |= GE_STORABLE_TUPLE_TYPE;
			GE_storable_out_write_integer_32(a_buffer, &l_gen_type, 1);
			l_gen_type = l_type_info->generic_parameter_count;
			GE_storable_out_write_integer_32(a_buffer, &l_gen_type, 1);
			l_gen_type = a_data->classes[l_type_id]->index;
			GE_storable_out_write_integer_32(a_buffer, &l_gen_type, 1);
		}
		l_count += 3;
	} else if (l_type_info->flags & GE_TYPE_FLAG_NONE) {
		l_gen_type |= GE_STORABLE_NONE_TYPE;
		if (a_buffer) GE_storable_out_write_integer_32(a_buffer, &l_gen_type, 1);
		l_count++;
	} else {
		l_gen_type = a_data->classes[l_type_id]->index;
		if (a_buffer) GE_storable_out_write_integer_32(a_buffer, &l_gen_type, 1);
		l_count++;
	}
	nb = l_type_info->generic_parameter_count;
	for (i = 0; i < nb; i++) {
		l_count += GE_storable_out_write_object_subtype(a_buffer, a_data, GE_decoded_type(l_type_info->generic_parameters[i]));
	}
	return l_count;
}

/*
 * Write type of `a_object' to Storable buffer `a_buffer'.
 */
static void GE_storable_out_write_object_type(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, GE_storable_out_object* a_object)
{
	EIF_TYPE l_type = {0, 0};
	uint32_t l_count;

	l_type.id = a_object->class->type_info->type_id;
	l_count = GE_storable_out_write_object_subtype(0, a_data, l_type);
	GE_storable_out_write_natural_32(a_buffer, &l_count, 1);
	if (l_count > 1) {
		GE_storable_out_write_object_subtype(a_buffer, a_data, l_type);
	}
}

/*
 * Write special object `a_object' to Storable buffer `a_buffer'.
 */
static void GE_storable_out_write_special_subobject(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, GE_storable_out_object* a_object)
{
	GE_type_info* l_type_info;
	GE_attribute* l_runtime_attribute;
	uint32_t l_item_offset;
	uint32_t l_item_size;
	uint16_t l_item_flags;
	EIF_TYPE l_item_type;
	uint32_t i, l_count;
	uint32_t l_capacity;
	EIF_SPECIAL* l_special;
	int8_t l_pointer_size;
	GE_storable_out_attribute* l_attribute;
	GE_storable_out_object* l_expanded_object;
	EIF_REFERENCE l_ref;
	uint64_t l_void = 0;
	uint64_t l_pointer;

	l_type_info = a_object->class->type_info;
	l_special = (EIF_SPECIAL*)(a_object->object);
	/* `count` */
	l_count = l_special->count;
	GE_storable_out_write_natural_32(a_buffer, &l_count, 1);
	/* `capacity` */
	l_capacity = l_special->capacity;
	GE_storable_out_write_natural_32(a_buffer, &l_capacity, 1);
	/* Note: the third attribute is for the item offset. */
	l_runtime_attribute = l_type_info->attributes[2];
	l_item_offset = l_runtime_attribute->offset;
	l_item_type = GE_decoded_type(l_runtime_attribute->type_id);
	l_item_flags = GE_type_infos[l_item_type.id].flags;
	if (!(l_item_flags & GE_TYPE_FLAG_EXPANDED)) {
		l_item_size = l_runtime_attribute->size;
		l_pointer_size = 8;
		GE_storable_out_write_integer_8(a_buffer, &l_pointer_size, 1);
		l_attribute = a_object->attributes;
		for (i = 0; i < l_count; i++) {
			l_ref = GE_reference_field_at(l_item_offset + i * l_item_size, l_special, 0);
			if (l_ref) {
				GE_storable_out_write_natural_64(a_buffer, &(l_attribute->value->address), 1);
				l_attribute = l_attribute->next;
			} else {
				GE_storable_out_write_natural_64(a_buffer, &l_void, 1);
			}
		}
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_BOOLEAN) {
		GE_storable_out_write_boolean(a_buffer, (EIF_BOOLEAN*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_CHARACTER_8) {
		GE_storable_out_write_character_8(a_buffer, (EIF_CHARACTER_8*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_CHARACTER_32) {
		GE_storable_out_write_character_32(a_buffer, (EIF_CHARACTER_32*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_8) {
		GE_storable_out_write_integer_8(a_buffer, (EIF_INTEGER_8*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_16) {
		GE_storable_out_write_integer_16(a_buffer, (EIF_INTEGER_16*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_32) {
		GE_storable_out_write_integer_32(a_buffer, (EIF_INTEGER_32*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_64) {
		GE_storable_out_write_integer_64(a_buffer, (EIF_INTEGER_64*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_8) {
		GE_storable_out_write_natural_8(a_buffer, (EIF_NATURAL_8*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_16) {
		GE_storable_out_write_natural_16(a_buffer, (EIF_NATURAL_16*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_32) {
		GE_storable_out_write_natural_32(a_buffer, (EIF_NATURAL_32*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_64) {
		GE_storable_out_write_natural_64(a_buffer, (EIF_NATURAL_64*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_REAL_32) {
		GE_storable_out_write_real_32(a_buffer, (EIF_REAL_32*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_REAL_64) {
		GE_storable_out_write_real_64(a_buffer, (EIF_REAL_64*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
	} else if ((l_item_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_POINTER) {
		if (sizeof(EIF_POINTER) == sizeof(uint64_t)) {
			GE_storable_out_write_pointer(a_buffer, (uint64_t*)GE_field_address_at(l_item_offset, l_special, 0), l_count);
		} else {
			l_pointer_size = 8;
			GE_storable_out_write_integer_8(a_buffer, &l_pointer_size, 1);
			for (i = 0; i < l_count; i++) {
				l_pointer = 0;
				l_pointer |= (uint64_t)GE_pointer_field_at(l_item_offset + i * sizeof(EIF_POINTER), l_special, 0);
				GE_storable_out_write_natural_64(a_buffer, &l_pointer, 1);
			}
		}
	} else {
		/* Non-basic expanded item type. */
		l_item_size = l_runtime_attribute->size;
		l_attribute = a_object->attributes;
		l_expanded_object = l_attribute->value;
		l_expanded_object->flags &= ~GE_STORABLE_EO_TYPE;
		l_expanded_object->flags |= l_expanded_object->class->index;
		GE_storable_out_write_natural_32(a_buffer, &(l_expanded_object->flags), 1);
		GE_storable_out_write_object_type(a_buffer, a_data, l_expanded_object);
		l_item_size = l_runtime_attribute->size;
		for (i = 0; i < l_count; i++) {
			l_expanded_object->object = (void*)GE_field_address_at(l_item_offset + i * l_item_size, l_special, 0);
			GE_storable_out_write_subobject(a_buffer, a_data, l_expanded_object);
		}
	}
}

/*
 * Write tuple object `a_object' to Storable buffer `a_buffer'.
 */
static void GE_storable_out_write_tuple_subobject(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, GE_storable_out_object* a_object)
{
	GE_type_info* l_type_info;
	uint32_t i, l_count;
	GE_attribute* l_runtime_attribute;
	EIF_TYPE_INDEX l_runtime_type;
	GE_storable_out_attribute* l_attribute;
	EIF_REFERENCE l_ref;
	uint64_t l_void = 0;
	uint16_t l_flags;
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

	l_type_info = a_object->class->type_info;
	l_count = l_type_info->attribute_count;
	/* `count` */
	GE_storable_out_write_natural_32(a_buffer, &l_count, 1);
	/* `capacity` */
	GE_storable_out_write_natural_32(a_buffer, &l_count, 1);
	/* `object_comparison` is the first attribute in the current system. */
	l_code = GE_STORABLE_TUPLE_BOOLEAN_CODE;
	GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
	l_runtime_attribute = l_type_info->attributes[0];
	l_bool = GE_boolean_field_at(l_runtime_attribute->offset, a_object->object, 0);
	GE_storable_out_write_boolean(a_buffer, &l_bool, 1);
	l_attribute = a_object->attributes;
	for (i = 1; i < l_count; i++) {
		l_runtime_attribute = l_type_info->attributes[i];
		l_runtime_type = GE_decoded_type(l_runtime_attribute->type_id).id;
		l_flags = GE_type_infos[l_runtime_type].flags;
		if (!(l_flags & GE_TYPE_FLAG_EXPANDED)) {
			l_code = GE_STORABLE_TUPLE_REFERENCE_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_ref = GE_reference_field_at(l_runtime_attribute->offset, a_object->object, 0);
			if (l_ref) {
				GE_storable_out_write_pointer(a_buffer, &(l_attribute->value->address), 1);
				l_attribute = l_attribute->next;
			} else {
				GE_storable_out_write_pointer(a_buffer, &l_void, 1);
			}
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_BOOLEAN) {
			l_code = GE_STORABLE_TUPLE_BOOLEAN_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_bool = GE_boolean_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_boolean(a_buffer, &l_bool, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_CHARACTER_8) {
			l_code = GE_STORABLE_TUPLE_CHARACTER_8_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_char8 = GE_character_8_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_character_8(a_buffer, &l_char8, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_CHARACTER_32) {
			l_code = GE_STORABLE_TUPLE_CHARACTER_32_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_char32 = GE_character_32_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_character_32(a_buffer, &l_char32, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_8) {
			l_code = GE_STORABLE_TUPLE_INTEGER_8_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_int8 = GE_integer_8_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_integer_8(a_buffer, &l_int8, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_16) {
			l_code = GE_STORABLE_TUPLE_INTEGER_16_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_int16 = GE_integer_16_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_integer_16(a_buffer, &l_int16, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_32) {
			l_code = GE_STORABLE_TUPLE_INTEGER_32_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_int32 = GE_integer_32_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_integer_32(a_buffer, &l_int32, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_64) {
			l_code = GE_STORABLE_TUPLE_INTEGER_64_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_int64 = GE_integer_64_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_integer_64(a_buffer, &l_int64, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_8) {
			l_code = GE_STORABLE_TUPLE_NATURAL_8_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_nat8 = GE_natural_8_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_natural_8(a_buffer, &l_nat8, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_16) {
			l_code = GE_STORABLE_TUPLE_NATURAL_16_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_nat16 = GE_natural_16_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_natural_16(a_buffer, &l_nat16, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_32) {
			l_code = GE_STORABLE_TUPLE_NATURAL_32_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_nat32 = GE_natural_32_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_natural_32(a_buffer, &l_nat32, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_64) {
			l_code = GE_STORABLE_TUPLE_NATURAL_64_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_nat64 = GE_natural_64_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_natural_64(a_buffer, &l_nat64, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_REAL_32) {
			l_code = GE_STORABLE_TUPLE_REAL_32_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_real32 = GE_real_32_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_real_32(a_buffer, &l_real32, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_REAL_64) {
			l_code = GE_STORABLE_TUPLE_REAL_64_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_real64 = GE_real_64_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_real_64(a_buffer, &l_real64, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_POINTER) {
			l_code = GE_STORABLE_TUPLE_POINTER_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			l_pointer = (uintptr_t)GE_pointer_field_at(l_runtime_attribute->offset, a_object->object, 0);
			GE_storable_out_write_pointer(a_buffer, &l_pointer, 1);
		} else {
			/* Non-basic expanded type. */
			l_code = GE_STORABLE_TUPLE_REFERENCE_CODE;
			GE_storable_out_write_natural_8(a_buffer, &l_code, 1);
			GE_storable_out_write_pointer(a_buffer, &(l_attribute->value->address), 1);
			l_attribute = l_attribute->next;
		}
	}
}

/*
 * Write regular object `a_object' to Storable buffer `a_buffer'.
 */
static void GE_storable_out_write_regular_subobject(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, GE_storable_out_object* a_object)
{
	GE_type_info* l_type_info;
	uint16_t l_flags;
	uint32_t i, nb;
	EIF_TYPE_INDEX l_runtime_type;
	GE_attribute* l_runtime_attribute;
	GE_storable_out_attribute* l_attribute;
	uint32_t l_physical_offset = 0;
	EIF_REFERENCE l_ref;
	uint64_t l_void = 0;
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

	l_type_info = a_object->class->type_info;
	if ((l_type_info->flags & GE_TYPE_FLAG_EXPANDED) && !(l_type_info->flags & GE_TYPE_FLAG_BASIC_MASK) && !a_object->is_expanded) {
		/* This is a boxed non-basic expanded object. */
		l_physical_offset = l_type_info->attributes[l_type_info->attribute_count]->offset;
	}
	l_attribute = a_object->attributes;
	nb = l_type_info->attribute_count;
	/*  Note: attributes are stored in reverse order in the Storable file! */
	for (i = nb; i > 0; i--) {
		l_runtime_attribute = l_type_info->attributes[i - 1];
		l_runtime_type = GE_decoded_type(l_runtime_attribute->type_id).id;
		l_flags = GE_type_infos[l_runtime_type].flags;
		if (!(l_flags & GE_TYPE_FLAG_EXPANDED)) {
			l_ref = GE_reference_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			if (l_ref) {
				GE_storable_out_write_pointer(a_buffer, &(l_attribute->value->address), 1);
				l_attribute = l_attribute->next;
			} else {
				GE_storable_out_write_pointer(a_buffer, &l_void, 1);
			}
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_BOOLEAN) {
			l_bool = GE_boolean_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_boolean(a_buffer, &l_bool, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_CHARACTER_8) {
			l_char8 = GE_character_8_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_character_8(a_buffer, &l_char8, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_CHARACTER_32) {
			l_char32 = GE_character_32_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_character_32(a_buffer, &l_char32, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_8) {
			l_int8 = GE_integer_8_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_integer_8(a_buffer, &l_int8, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_16) {
			l_int16 = GE_integer_16_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_integer_16(a_buffer, &l_int16, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_32) {
			l_int32 = GE_integer_32_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_integer_32(a_buffer, &l_int32, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_INTEGER_64) {
			l_int64 = GE_integer_64_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_integer_64(a_buffer, &l_int64, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_8) {
			l_nat8 = GE_natural_8_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_natural_8(a_buffer, &l_nat8, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_16) {
			l_nat16 = GE_natural_16_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_natural_16(a_buffer, &l_nat16, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_32) {
			l_nat32 = GE_natural_32_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_natural_32(a_buffer, &l_nat32, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_NATURAL_64) {
			l_nat64 = GE_natural_64_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_natural_64(a_buffer, &l_nat64, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_REAL_32) {
			l_real32 = GE_real_32_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_real_32(a_buffer, &l_real32, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_REAL_64) {
			l_real64 = GE_real_64_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_real_64(a_buffer, &l_real64, 1);
		} else if ((l_flags & GE_TYPE_FLAG_BASIC_MASK) == GE_TYPE_FLAG_POINTER) {
			l_pointer = (uintptr_t)GE_pointer_field_at(l_runtime_attribute->offset, a_object->object, l_physical_offset);
			GE_storable_out_write_pointer(a_buffer, &l_pointer, 1);
		} else {
			GE_storable_out_write_object(a_buffer, a_data, l_attribute->value);
			l_attribute = l_attribute->next;
		}
	}
}

/*
 * Write object `a_object' to Storable buffer `a_buffer'.
 */
static void GE_storable_out_write_subobject(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, GE_storable_out_object* a_object)
{
	if (a_object->flags & GE_STORABLE_EO_TUPLE) {
		GE_storable_out_write_tuple_subobject(a_buffer, a_data, a_object);
	} else if (a_object->flags & GE_STORABLE_EO_SPEC) {
		GE_storable_out_write_special_subobject(a_buffer, a_data, a_object);
	} else {
		GE_storable_out_write_regular_subobject(a_buffer, a_data, a_object);
	}
}

/*
 * Write object `a_object' to Storable buffer `a_buffer'.
 */
static void GE_storable_out_write_object(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data, GE_storable_out_object* a_object)
{
	GE_storable_out_write_pointer(a_buffer, &(a_object->address), 1);
	a_object->flags &= ~GE_STORABLE_EO_TYPE;
	a_object->flags |= a_object->class->index;
	GE_storable_out_write_natural_32(a_buffer, &(a_object->flags), 1);
	GE_storable_out_write_object_type(a_buffer, a_data, a_object);
	GE_storable_out_write_subobject(a_buffer, a_data, a_object);
}

/*
 * Write objects to Storable buffer `a_buffer'.
 */
static void GE_storable_out_write_objects(GE_storable_out_buffer* a_buffer, GE_storable_out_data* a_data)
{
	GE_storable_out_object* l_object;

	GE_storable_out_write_integer_32(a_buffer, &(a_data->object_count), 1);
	l_object = a_data->objects;
	while (l_object) {
		if (!(l_object->is_expanded) || l_object->in_tuple) {
			GE_storable_out_write_object(a_buffer, a_data, l_object);
		}
		l_object = l_object->next_in_list;
	}
}

/*
 * Store `a_object' to Storable buffer `a_buffer'.
 */
static void GE_storable_store_to_buffer(EIF_REFERENCE a_object, GE_storable_out_buffer* a_buffer)
{
	GE_storable_out_data* l_data;
	int8_t l_storable_format; /* Storable format, independent_store, etc. */
	char l_storable_properties; /* Storable properties. */
	int16_t l_overhead_size; /* Size of object overhead in ISE runtime. */
	
	l_data = GE_storable_out_new_data();
	GE_storable_out_record_objects(a_object, l_data);
	l_storable_format = GE_INDEPENDENT_STORE_6_6;
	l_storable_properties = 0;
	l_overhead_size = 16;
	a_buffer->write_char(a_buffer, (char*)&l_storable_format, 1);
	a_buffer->write_char(a_buffer, &l_storable_properties, 1);
	GE_storable_out_write_integer_16(a_buffer, &l_overhead_size, 1);
	GE_storable_out_write_classes(a_buffer, l_data);
	GE_storable_out_write_objects(a_buffer, l_data);
	GE_storable_out_flush_buffer(a_buffer);
	GE_storable_out_free_data(l_data);
}

/*
 * Store `a_object' to Storable file `a_file_desc'.
 */
void GE_storable_store_to_file(EIF_REFERENCE a_object, EIF_INTEGER a_file_desc)
{
	GE_storable_out_buffer* l_buffer;

	l_buffer = GE_storable_out_new_buffer_from_file(GE_storable_write, a_file_desc);
	GE_storable_store_to_buffer(a_object, l_buffer);
	GE_storable_out_free_buffer(l_buffer);
}

#else

/*
 * Store `a_object' to Storable file `a_file_desc'.
 */
void GE_storable_store_to_file(EIF_REFERENCE a_object, EIF_INTEGER a_file_desc)
{
	GE_raise_with_message(GE_EX_RETR, "Independent store: no information about attributes in current system");
}

#endif

#ifdef __cplusplus
}
#endif

#endif
