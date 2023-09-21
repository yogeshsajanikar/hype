import os
import shlex
import shutil
import subprocess
import zipfile

def _build():
    
    import hy
    import py_compile
    
    cur_dir = os.path.dirname(__file__)    
    src_dir = os.path.join(cur_dir, 'src')
    
    for dir_name, sub_dirs, file_names in os.walk(src_dir):
        for file_name in file_names:
            if file_name.endswith('.hy'):
                file_path = os.path.join(dir_name, file_name)
                print("Compiling %s" % file_path)
                py_compile.compile(file_path, invalidation_mode=py_compile.PycInvalidationMode.CHECKED_HASH)



def build(**kwargs):
    try:
        _build()
        
    except Exception as e:
        print("Unable to build hylang: %s" % e)
        
        
if __name__ == '__main__':
    build()
