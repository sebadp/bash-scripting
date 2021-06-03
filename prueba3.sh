 #!/bin/bash
 ################################
 # prueba3.sh                   #
 # script renombramiento masivo #
 # Sebastián Dávila             #
 ################################
 #
 # Funcion space_killer()
 # Replace all spaces in files names with "_"
function space_killer(){
 cd $1
 for f in *
 do
   new="${f// /_}"
   if [ "$new" != "$f" ]
   then
     mv "$f" "$new"
   fi
 done
} 


 # Funcion rename()
 # Extracts all files with the .txt extension and renames them
 # with the TXT_RENAME_PREFIX if exists as a local variable
 # If not, it uses the default value = "RN_"
 # Input: directory to modify
 # Output: A list with original names and new ones. 
function rename(){
 if [[ $TXT_RENAME_PREFIX ]]
 then
     prefix=$TXT_RENAME_PREFIX
 else
     prefix='RN_'
 fi
 cd $1
 for file in `ls *.txt`
 do
  newName=$prefix$(basename $file)
  name=$(basename $file)	
  echo "Nombre original: $(basename $file) | Nuevo nombre: $prefix$(basename $file)"
  mv $file $newName
 done
}
 
 
space_killer $1 
rename $1
 
 
