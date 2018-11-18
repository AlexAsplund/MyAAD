# Installing MyAAD


## Download and move module to Module dir (User scope)

    Start-BitsTransfer https://github.com/AlexAsplund/MyAAD/archive/master.zip -TransferType Download
    Expand-Archive .\master.zip
    mv .\master\MyAAD-master\Release\MyAAD $Env:HOMEPATH\Documents\WindowsPowerShell\Modules\MyAAD
    rm .\master.zip, master

## Import Module
    
    $Env:HOMEPATH\Documents\WindowsPowerShell\Modules\MyAAD