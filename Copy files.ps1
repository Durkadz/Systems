#$Original = C:\Users\ivan.redondo\Desktop\Kyocera\SDK211603\Original.csv
#$Importacion = C:\Users\ivan.redondo\Desktop\Kyocera\SDK211603\Ruta.csv

$Ori = Import-Csv C:\Users\ivan.redondo\Desktop\Kyocera\SDK209205\Original.csv 


foreach ($Or in $Ori){

$fichero = $or.ubi

Copy-Item -path \\fsesbes28001004\F$\$fichero -destination \\fsesbes28001004\f$\MyDoc\BD07\SDK209205


}
