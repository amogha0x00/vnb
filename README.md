Just download install.sh file and run

    ./install.sh
   
# OR Do it manually

# For vimrc and bashrc files
  
  Move to downloaded directory
  
    cp vimrc ~/.vimrc
    cp bashrc ~/.bashrc
  
# For Android Rules

Place 51-android.rules in /etc/udev/rules.d/

   Move to downloaded directory
  
    sudo cp 51-android.rules /etc/udev/rules.d/
  
then

    sudo udevadm control --reload
    sudo service udev restart
