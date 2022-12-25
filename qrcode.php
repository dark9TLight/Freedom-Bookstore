<?php
    echo "<center>Please scan the QR Code to redirect to online banking</center>";
    echo '<br />';
    echo "<center>Please pay on this account number</center>";
    echo '<hr />';
    echo "<center><b>0345768265498761 (Bank Islam)</b></center>";
    echo "<center><b>Important Note:</b> After payment please come back to this page and <b>Click Button Done</b> if you done with the payment</center>";
    include('phpqrcode/qrlib.php');
    
    //save PNG codes to server
    
    $tempDir = "qrcodes/";
    
    $codeContents = 'https://www.bankislam.biz/';
    //generate filename for Qr code
    
    $fileName = '005_file_'.md5($codeContents).'.png';
    
    $pngAbsoluteFilePath = $tempDir.$fileName;
    $urlRelativeFilePath = $tempDir.$fileName;
    
    // displaying
    $ecc = 'Q';
    $pixel_Size = 5;
    $frame_Size = 5;
    QRcode::png($codeContents, $tempDir.$fileName, $ecc, $pixel_Size, $frame_Size);

    echo '<hr />';
    echo '<center><img src="'.$urlRelativeFilePath.'"/></center>';
    echo '<hr />';
    echo "<center>Please screenshot the receipt and send it to this number : <b>0199114578</b></center>";
    echo '<hr />';
    
    
?>