# pedja_bulk_rename_adc
powershell bulk rename computers in ad with test is pc online adn is new name already taken


For windows  7,8,10,11 i server 2008>
Powershell > v3.0 


1.	Run PowerShell with "Run As Administrator“
2.  adc.csv  - delimiter must be „ , “

oldname,newname
WEDSKS0022,RKVKS0110
WEDSKS0117,RKVKS1413

3.	.\pedja_bulk_rename_adc.ps1
4.	script will restart client computers
5.	log file nisuprosli 30-03-2022-1003.csv with list of computers that are not renamed


Powershell script frstly check is PC online and is new name maybe taken and then will rename PC


![image](https://user-images.githubusercontent.com/27769532/160804806-25e90c52-1b12-4cc8-9ea5-068a3b6801c7.png)



Od windowsa  7,8,10,11 i servera 2008>
Powershell mora biti preko v3.0 

1.	Zip fajl iz priloga se raspakuje u neki folder
2.	Otvori se PowerShell sa "Run As Administrator“
3.	Cd u folder gde se nalaze raspakovani fajlovi
4.	Pripremi se adc.csv  - delimiter mora biti „ , “

oldname,newname
WEDSKS0022,RKVKS0110
WEDSKS0117,RKVKS1413

5.	.\pedja_bulk_rename_adc.ps1
6.	I nakon unosa admin ad usera  skripta počinje da radi
7.	U folderu dobićete fajl naziva  nisuprosli 30-03-2022-1003.csv sa spiskom pc čiji rename nije uspeo, pa to možete iskoristiti za naredna puštanja bulk rename-a


Powershell skripta preimenovaće računare po adc.csv-u, proveri prvo da li je PC online ili ne, pa proveri da li novo ime možda postoji na mreži, pa tek onda vrši rename računara uz restart.


Pozdrav
