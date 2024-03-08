#!/usr/bin/env python3

import glob
import os
import pandas as pd
import pathlib

home_dir = os.path.expanduser('~')
script_path = os.path.abspath(__file__)
script_dir  = os.path.dirname(script_path)


# map each field to its *direct* superclasses' fields that it inherited redefined or renamed
# field => set(field)
parent_fields = {}

# map each field to its subclasses' fields at *any* level
# field => {class name: {field: set(path)}}
descendant_fields = {}


# walk the parent_fields dict all the way up to the root from arg: path[ ... field]
def mark_descendants(path):
  head_field = path[0]  # head of the path!
  if head_field not in parent_fields:  # head_field has no parent_fields
    return
  parents = parent_fields[head_field]

  class_name, field_name = path[-1].split(".")  # only take the leaf field!

  for parent_field in parents:
    curr_path = (parent_field,) + path
    if parent_field not in descendant_fields:
      descendant_fields[parent_field] = {}
    if class_name not in descendant_fields[parent_field]:
      descendant_fields[parent_field][class_name] = {}
    if field_name not in descendant_fields[parent_field][class_name]:
      descendant_fields[parent_field][class_name][field_name] = set()
    descendant_fields[parent_field][class_name][field_name].add(curr_path)

    mark_descendants(curr_path)  # recursive call


def find_longest_common_ancestors_len(paths):
  n = len(paths)
  if n == 0:
    return 0

  l = min([len(path) for path in paths])
  for i in range(l):
    if n != sum([path[i] == paths[0][i] for path in paths]):
      return i

  return l


INHERITED_FIELDS_FN = "inherited_fields.path"
def detect_diamond(ecf_fn):
  edges = pd.read_csv(INHERITED_FIELDS_FN, sep="[,\.]", skiprows=3, skipfooter=1, engine='python',
      names=["kind", "src_class", "src_field", "tgt_class", "tgt_field"])
  # print(edges)

  # populate the direct parent_fields dict
  for i, edge in edges.iterrows():
    # print(edge)
    tgt = edge["tgt_class"] + "." + edge["tgt_field"]
    src = edge["src_class"] + "." + edge["src_field"]
    if tgt not in parent_fields:
      parent_fields[tgt] = set()
    parent_fields[tgt].add(src)
  # print("total fields: ", len(parent_fields))

  for field in parent_fields.keys():  # mark all the field's ancestors at *any* level
    mark_descendants((field,))

  # check descendant_fields, if any field mapped into a same class' multiple target field
  for field, clazzs in descendant_fields.items():
    for class_name, field_paths in clazzs.items():
      if len(field_paths.keys()) >= 2:  # i.e ends up with >=2 different names
        print('=' * 40, ecf_fn, "total fields: ", len(parent_fields))
        new_fields = "%s.{%s}" % (class_name, ", ".join(field_paths.keys()))
        print("diamond found, full paths: ", field, " => ", new_fields)
        paths = []
        for new_field, path in field_paths.items():
          assert(isinstance(path, set))
          paths.extend(path)
          print("  ", new_field, path)
        l = find_longest_common_ancestors_len(paths)
        print("new_fields:", new_fields)
        print("diamond core: ", paths[0][l-1], " => ", new_fields)
        for new_field, path in field_paths.items():
          print("  ", new_field, [p[l-1:] for p in path])


def process_all_ecf():

  ecf_fns = glob.glob('**/*.ecf', recursive=True)
  for ecf_fn in ecf_fns:
    try:
      # "%s/project/contrib/gobo/tool/gedoc" home_dir
      pathlib.Path(INHERITED_FIELDS_FN).unlink(missing_ok=True)
      cmd = "%s/gedoc --format=field_rename %s > %s" % (script_dir, ecf_fn, INHERITED_FIELDS_FN)
      # print(cmd)
      os.system(cmd)
      detect_diamond(ecf_fn)
    except:
      print("skip ", ecf_fn)

if __name__ == "__main__":
  process_all_ecf()

