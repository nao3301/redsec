#!/bin/bash

echo "install ruby via brew"
CHECK=0
if brew install ruby; then
    echo "done"
    CHECK=1
else
    echo "Error"
    CHECK=0
fi
echo "installing net-ping via gem"
if sudo gem install net-ping; then
    echo "done"
    CHECK=1
else
    echo "Error"
    CHECK=0
fi
echo "create redsec alias file"
if 
    echo "#!/bin/bash

cd $PWD
ruby redsec.rb" > redsec; then 
    echo "done"
    CHECK=1
else
    echo "Error"
    CHECK=0
fi
echo "copy alias to use redsec from erverywhere"
if sudo cp $PWD/redsec /usr/local/bin/redsec
sudo chmod +x /usr/local/bin/redsec; then
    echo "done"
    CHECK=1
else
    echo "Error"
    CHECK=0
fi
if CHECK==1; then
    echo "installation completed succsessfully"
else
    echo "Something went wrong."
fi
