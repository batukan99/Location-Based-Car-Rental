# Location Based Car Rental
The purpose of this project is to develop a software which helps users to easily find rentable vehicles no matter where they are. This application will allow each user to rent a vehicle like a car as well as rent out their own car, likewise car rental companies will be able to offer their own vehicles to users on this platform. Briefly, according to their needs, people and companies can put their own vehicles to rent out in the system, so that the rental vehicles are listed according to the proximity of each desired region and it becomes easier to find a rental car, again, people can hire a vehicle by considering the color, price, rental date they want.

## Screenshots
![resim](https://user-images.githubusercontent.com/76396946/125458980-ee70202b-f097-466b-9b29-22b1a6216826.png)
![resim](https://user-images.githubusercontent.com/76396946/125459041-11df16ba-46ae-48a4-8e9b-16b3056b95bf.png)

![resim](https://user-images.githubusercontent.com/76396946/125459069-35423fe6-08b4-4f07-8768-fb71af59a570.png)
![resim](https://user-images.githubusercontent.com/76396946/125459086-9c8c41ee-eaea-49ed-99d3-6a544b809411.png)

![resim](https://user-images.githubusercontent.com/76396946/125459118-24d23246-cf11-4402-8365-f897a2a99623.png)
![resim](https://user-images.githubusercontent.com/76396946/125459164-5cd41a35-c5df-413f-86ab-44c700851a5f.png)

## Installation

### Xampp
1. Download and install Xampp [here](https://www.apachefriends.org/tr/index.html).
2. Run Xampp as administrator, then click explorer and find htdocs folder.
3. Put database/rental folder inside htdocs.
4. Start Apache and MySQL on Xampp.

### PhpMyAdmin
1. On Xampp, click Admin button near MySQL>Start button to open PhpMyAdmin interface.
2. Create new database named as "rental" and select.
3. Click import>select file and choose ddl_rent.sql inside database folder.
4. Deactivate 'Enable Foreign Key Checks' and click go.
5. Repeat step 3 and 4 for dml_rent.sql inside database folder.

### VsCode or your favorite IDE
1. Create new project and open terminal.
2. Run below command on terminal.
```
git clone https://github.com/batukan99/Location-Based-Car-Rental
```
3. Open cmd on windows, write ipconfig.
4. Copy IPv4 Address.
5. Open lib/connections.dart then on line 8 change "192.168.1.6" part with your IPv4 Address.
6. Finally run below commands on terminal to test app.
```
cd Location-Based-Car-Rental
flutter run
```
**Hint:** You may need to repeat steps 3, 4 and 5 if you get "XMLHttpRequest" error.
