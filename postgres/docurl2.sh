#curl -d "UnknownWrestler:GET" http://localhost:3000/wrestler.php
curl -d "ec4f39ef-2d63-4adc-ad2d-ac43f81de875:GET" http://localhost:6060/coin.php
#curl -d "ec4f39ef-2d63-4adc-ad2d-ac43f81de875:ADD:10" http://localhost:6060/coin.php
echo ""
curl -d "ec4f39ef-2d63-4adc-ad2d-ac43f81de875:GET" http://localhost:6060/wrestler.php
#curl -d "ec4f39ef-2d63-4adc-ad2d-ac43f81de875:ADD:1" http://localhost:6060/wrestler.php
echo ""
#curl -d "ec4f39ef-2d63-4adc-ad2d-ac43f81de875:ADD:My Wonderful Product" http://localhost:6060/sales.php

#curl -d "MULTIADD:ec4f39ef-2d63-4adc-ad2d-ac43f81de875:5:ec4f39ef-2d63-4adc-ad2d-ac43f81de876:2" http://localhost:6060/wrestler.php
