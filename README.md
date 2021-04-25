# GEOS-Chem v12.1.0 - Updated for GBD-MAPS project

https://zenodo.org/record/4718622

The default GEOS-Chem v12.1.0 source code (https://doi.org/10.5281/zenodo.1553349) was updated to include the following:

1. Parameterization for N2O5 heterogneous uptake - following McDuffie et al., 2018a (impelmented in default GCv12.6.0 https://doi.org/10.5281/zenodo.3507501)
2. Heterogeneous production of ClNO2 from sea salt aerosol - following implmentation in Shah et al., 2018 and ClNO2 yield recommendations from McDuffie et al., 2018b
3. Reduced dry deposition rates for HNO3 at cold temperatures - following Shah et al., 2018 (implemented in default GCv12.6.0 https://doi.org/10.5281/zenodo.3507501)
4. Updated wet deposition scheme - following Luo et al., 2019 (updated version included as an option starting in GCv12.7.0 https://doi.org/10.5281/zenodo.3634864)

Additional minor updates (bug fixes) from later versions of the default GEOS-Chem source code included here:
1. Updated HEMCO_config.rc file to read in the uodated MEGAN/2018-05 PFT (plant functional type) file (update in 12.3.0: http://wiki.seas.harvard.edu/geos-chem/index.php/GEOS-Chem_12#12.3.0) 
2. Updated MEGAN extension to correctly calcuatle monoterpene concentraions (bug fix in v12.3.0: http://wiki.seas.harvard.edu/geos-chem/index.php/GEOS-Chem_12#12.3.0)
2. Changed erruptive volcanic emisssions to 'R' in HEMCO_Config.rc file, maintained 'C' cycling for degassing emissions (bug fix in 12.3.0: http://wiki.seas.harvard.edu/geos-chem/index.php/GEOS-Chem_12#12.3.0)
4. Turned on photoloysis for DHDC and turned off photolysis for DHDN (update in 12.3.2: http://wiki.seas.harvard.edu/geos-chem/index.php/GEOS-Chem_12#12.3.2) 
5. Removed CO from MEGAN HEMCO extension to avoid double counting (updated in 12.5.0)
6. Updated volanic emissions to AeroCom (extended to 2018) (updated in 12.3.0, 12.4.0, and 12.5.0: http://wiki.seas.harvard.edu/geos-chem/index.php/GEOS-Chem_12#12.5.0)
7. Fixed heterogeneous cloud parameters in the HetRates file (update in 12.5.0: http://wiki.seas.harvard.edu/geos-chem/index.php/GEOS-Chem_12#12.5.0)
8. Changed stratospheric Bry $MM in HEMCO_Config to 1-12 to make sure emissions are read correctly each moth (v12.5.0: http://wiki.seas.harvard.edu/geos-chem/index.php/GEOS-Chem_12#12.5.0)
9. Removed 27% scaling factor for POG from GFEd emissions (updated in 12.5.0, from Pai et al., 2019)
10. Updated GFED emissions to the 4s beta version (updated in v12.8.0: http://wiki.seas.harvard.edu/geos-chem/index.php/GEOS-Chem_12#12.8.0)


### References:
Luo G, Yu F, & Schwab J (2019) Revised treatment of wet scavenging processes dramatically improves GEOS-Chem 12.0.0 simulations of nitric acid, nitrate, and ammonium over the United States. Geosci. Model Dev. Discuss. 2019:1-18.

McDuffie EE, et al. (2018a) Heterogeneous N2O5 Uptake During Winter: Aircraft Measurements During the 2015 WINTER Campaign and Critical Evaluation of Current Parameterizations. J. Geophys. Res. Atmos. 123(8):4345-4372.

McDuffie EE, et al. (2018b) ClNO2 Yields From Aircraft Measurements During the 2015 WINTER Campaign and Critical Evaluation of the Current Parameterization. J. Geophys. Res. Atmos. 123(22):12,994-913,015.

Pai SJ, et al. (2019) An evaluation of global organic aerosol schemes using airborne observations. Atmos. Chem. Phys. Discuss. 2019:1-39.

Shah V, et al. (2018) Chemical feedbacks weaken the wintertime response of particulate sulfate and nitrate to emissions reductions over the eastern United States. P. Natl. Acad. Sci. 115:8110-8115.


****
The following is the README from the official GEOS-Chem Source code repository
****


# README for the Official GEOS-Chem Source code repository

The Official GEOS-Chem repository (https://github.com/gcst/geos-chem) contains the source code for the GEOS-Chem model of atmospheric chemistry and composition. 

## We have migrated from Bitbucket to Github!
As of June 2018, we have migrated the GEOS-Chem source code repository to back Github.  Going forward, please make sure to clone or pull code updates ONLY from this repository.

## GEOS-Chem Development

### Branches
This repository contains several branches.  Each branch contains code updates belonging to a particular line of development.

 * The __master__ branch always contains the __current stable version__.  You should never add new code directly into this branch.  Instead, open a new branch off of master and add your code there.

 * The __dev/X.Y.Z__ branches always contains in-development code for upcoming version X.Y.Z.  Code in dev/X.Y.Z is very much "work in progress" and should not be relied upon until it has been fully debugged, validated, and merged back into the master branch.

 * The __GEOS__ branch contains updates that are specific to the interface between GEOS-Chem and the NASA GEOS-DAS Earth System Model.  Most GEOS-Chem users can simply ignore this branch.

 * From time to time, you will see other branches pertaining to new lines of development being created.  These branches usually will start with __feature/__ or __bugfix/__.  Once the code in these branches has been sufficiently validated, these branches will be merged back into the master branch.  You should not use code in these branches.

### Versions

GEOS-Chem versions are now denoted by 3 digits (X.Y.Z):

 * The __X__ digit is the __major version number__.  A change in X denotes that the current version contains a significant update that breaks backwards-compatibility with the prior series of GEOS-Chem versions.  Major structural updates typically will require an update to X.  In the past we have changed the X digit when replacing SMVGEAR with FlexChem (version 10 to version 11) and replacing legacy emissions with HEMCO (version 9 to version 10).

* The __Y__ digit is the __feature version number__.  A change in Y denotes that a 1-month benchmark has been performed to validate a new feature or set of features.  Some (but not all) Y versions will have 1-year benchmarks performed as well.  In general, the Y digit changes whenever a new feature  breaks backwards compatibility with one or more run directories from the prior version.

* The __Z__ digit is the __bug fix (or patch) version number__.   A change in Z denotes that a bug fix was made that does not break backwards compatibility with run directories from the prior verison.  Z will also be updated when bug fixes or minor updates are made to one or more of the GEOS-Chem "Specialty" simulations.  Updating specialty simulations should not affect the output of the GEOS-Chem 1-month or 1-year benchmark simulations.

For more information, please see this wiki page: http://wiki.geos-chem.org/GEOS-Chem_version_numbering_system

All benchmarked GEOS-Chem versions are tagged in the Git history. Use _git tag_ in your terminal to see a list of available tags. Tags will also be highlighted in the _gitk_ browser window.

### Citing GEOS-Chem versions with DOI's

You can now cite GEOS-Chem in publications with a Digital Object Identifier (DOI). Each GEOS-Chem release will be assigned its own individual DOI.  DOI's for each GEOS-Chem version will be posted on the [GEOS-Chem website](http://geos-chem.org) and [GEOS-Chem wiki](http://wiki.geos-chem.org).

We have also generated a concept DOI, which will always point to the current stable version of GEOS-Chem (i.e. corresponding to the __master__ branch): [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1343546.svg)](https://doi.org/10.5281/zenodo.1343546)

# Documentation

### Web site
The __GEOS-Chem web site__ is a good place to get started.  It will point you to many important GEOS-Chem resources.
* http://www.geos-chem.org

### Online user's manual
You can find the __The GEOS-Chem User's Guide__ online here:
* http://manual.geos-chem.org

### Wiki
The most up-to-date information about GEOS-Chem is posted on the __GEOS-Chem wiki__.  Here you will find information about technical issues, bug fixes, and other pertinent topics.
* http://wiki-geos.chem.org

## GEOS-Chem run directories
To generate GEOS-Chem run directories, please clone the [__geos-chem-unittest__](https://github.com/geoschem/geos-chem-unittest) repository and follow the instructions as listed on this GEOS-Chem wiki page: http://wiki.seas.harvard.edu/geos-chem/index.php/Creating_GEOS-Chem_run_directories

## Support 
We encourage GEOS-Chem users to use the Github issue tracker attached to this repository to report  bugs or technical issues with the GEOS-Chem code.

You are also invited to direct GEOS-Chem support requests to the GEOS-Chem Support Team at geos-chem-support@as.harvard.edu.

14 Nov 2018
GEOS-Chem Support Team
geos-chem-support@as.harvard.edu
