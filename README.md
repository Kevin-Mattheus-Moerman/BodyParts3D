# BodyParts3D
This repository contains a collection of 3D models of for human anatomy as well as a [Julia language](https://julialang.org/) interface to parse the data. The 3D models are [`stl` files](https://en.wikipedia.org/wiki/STL_%28file_format%29) which have been converted from the original `.obj` files from the [BodyParts3D/Anatomography project](http://lifesciencedb.jp/bp3d/). The data is currently, unfortunately, only for a single male model. More models will be added if these become available. 

The license for the 3D files from the database is: Creative Commons Attribution-Share Alike 2.1 Japan. If you use data from this database, please be sure to attribute this database as follows: "BodyParts3D, (c)  The Database Center for Life Science licensed under CC Attribution-Share Alike 2.1 Japan".
http://dbarchive.biosciencedbc.jp/en/bodyparts3d/lic.html

![Banner image](bannerImage.jpg)

The data was here obtained using: 

```
wget -r --no-parent https://dbarchive.biosciencedbc.jp/data/bodyparts3d/20110915/
```

* The data used in this repository is refferred to as version `3.0` / `20110915`. The latest version `4.0`, although more complete, was not chosen as it appears to have intersecting skin/muscle areas. 

## Changes made to the downloaded data
* Non-English documents where removed
* The OBJ files contained in the BodyParts3D_3.0_obj_95.zip archive were converted to binary STL files, OBJ files were removed
* All models were visualised and PNG files were stored for each model

## Citing the data content
If you are making use of the files provided here, adhere to the `Creative Commons Attribution-Share Alike 2.1 Japan` license. Furthermore please cite the initial paper: 
> Mitsuhashi N, Fujieda K, Tamura T, Kawamoto S, Takagi T, Okubo K.
BodyParts3D: 3D structure database for anatomical concepts.
Nucleic Acids Res. 2009 Jan;37(Database issue):D782-5. Epub 2008 Oct 3.
https://doi.org/10.1093/nar/gkn613

As well as the data archive DOI: `http://doi.org/10.18908/lsdba.nbdc00837-000`

## Getting started

* The stl files are contained in the `stl` folder.
* To aid model discovery images are provided for each model in the `png` folder
* Most files are named using their [Foundational Model of Anatomy Ontology (FMA)](https://en.wikipedia.org/wiki/Foundational_Model_of_Anatomy) representation, which follows the format: FMA<_FMAID_>.stl.
* The assets folder contains several `.txt` files which list the FMAID allong with plain English names, e.g.:

| `FMAID`      | `English name` |
| ----------- | ----------- |
| 7163   | Skin      |
| 16586   | Right hip bone      |
| 24474      | Right femur       |
| 24477      | Right tibia      |
| 24480   | Right fibula       |

* For more information search the original website: http://lifesciencedb.jp/bp3d/
* Code based interfaces to interogate the model database are under development.

## Why STL files
The [BodyParts3D/Anatomography project](http://lifesciencedb.jp/bp3d/) provides OBJ rather than STL files. The benefit of OBJ files is that they are human-readable plain text files, in which one recognises entries like vertices and faces. However, these plain text files are too large for hosting on a plain GitHub repository (in particular models like for the skin were over 100 Mb). In this repository binary STL files are chosen since these are significantly smaller in size compared to plain text OBJ files (although no longer human-readable). Furthermore, GitHub is able to render STL files in the browser which aids to preview models (provided the STL file size is not too large).

## Contributing
Contributions are welcome! Please post issues and pull requests or email: __kevin.moerman@universityofgalway.ie.__

Contributions are especially welcome in relation to the following:
*Improvements to the Julia code
* Improving the means for users to retrieve content from this database. It remains challenging to retrieve and find files unless one is very familiar with the codes or the anatomical naming conventions.
* Adding efficient code based database interrogation, perhaps actually implementing an interface to the FMA ontology. 
* Some models are currently more suitable for "display purposes" than computational biomechanics work. Some processing of these model may be needed to provide valid/merged(or separated)/cured files. An example is the skin surface `FMA7163` which contains a complex mix of outer and inner surfaces (and non-manifold triagles). Isolation of the outer surface, curing of "holes", removal of non-manifold triangles, is needed to use the skin for applications like finite element mesh development.  

## Licenses

### Derived geometry and 3D model licenses
The materials provided under the [BodyParts3D/Anatomography project](http://lifesciencedb.jp/bp3d/), and any derivatives made available here (either directly or indirectly through posts-processing functionality), are licensed under the the following license:
_Creative Commons License Creative Commons Attribution-Inheritance 2.1 Japan (CC BY-SA)_

Please adhere to the license conditions when using/reusing the content shared from this resource.

The license can be viewed on the [Life Science Integrated Database Center website](http://lifesciencedb.jp/bp3d/info_en/license/index.html) and is also reproduced in [this repository](https://github.com/Kevin-Mattheus-Moerman/BodyParts3D/blob/main/LICENSE_content)

[![licensebuttons by-sa](https://licensebuttons.net/l/by-sa/3.0/88x31.png)](https://creativecommons.org/licenses/by-sa/2.1/jp/deed.en)

**BodyParts3D, Copyrightc 2008 Life Science Integrated Database Center licensed by CC Display-Inheritance 2.1 Japan**

### Software license
All software/code provided here, e.g. to interogate and process the geometry or image files, caries the permissive [MIT open source software license](https://github.com/Kevin-Mattheus-Moerman/BodyParts3D/blob/main/LICENSE).

## Citing this repository
This repository should be cited in any research that employs either the model content or the codes provided.
