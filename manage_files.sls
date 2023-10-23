create_path:
  file.directory:
    - name: C:\salt\srv\states\outputs
    - makedirs: True

create_file:
  file.managed:
    - name: C:\salt\srv\states\outputs\hello_world.txt
    - contents: Hello world
    - require: # Require a previous validation
      - file: create_path
