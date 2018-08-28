<!DOCTYPE html>
<html>
<body>

<?php
    include('conn.php'); 
    require_once('backup_restore.class.php'); 

    $newImport = new backup_restore($host,$db,$user,$pass);

    if(isset($_GET['process'])){
        $process = $_GET['process'];
        if($process == 'backup'){
            $message = $newImport -> backup ();   
        }
    }
    
?>


<br>
<br>
               <center> <h3>Backup Database</h3>
           
             
                        <?php if(isset($_GET['process'])): ?>
                            <?php 
                                $msg = $_GET['process'];   
                                $class = 'text-center';
                                switch($msg){
                                    case 'backup':
                                        $msg = 'Backup Success!<br />Silahkan Download <a href=backup/'.$message.' target=_blank >FILE DATABASE</a>'; 
                                        break;
                                    default:
                                        $class = 'hide';
                                }                                
                            ?>
                                <strong><?php echo $msg; ?></strong><br>
                        <?php endif; ?>
                        
        
                <br>
                            <a href="index.php?page=backupdata&process=backup ">
                                <button type="button" class="btn btn-success btn-lg span4"><i class="fa fa-database"></i> BACKUP DATABASE</button>
                            </a>
                      
                            
	
  
</center>
<script type="text/javascript">
    <?php if(isset($_POST['add_room'])) echo '$.jGrowl("Added Successfully!");'; ?>
</script>

</body>
</html>