<?php  
 $connect = mysqli_connect("localhost", "root", "", "onlineflatselling");  
 $sql = "SELECT seller.id,district,street,size,prize,rooms,floor,image FROM ((seller inner join property on seller.id=property.pid) inner join flat on flat.fid=property.pid) inner join images on images.imid=seller.id order by id asc "; 
 $result = mysqli_query($connect, $sql);
 
 ?>  
 <!DOCTYPE html>  
 <html>  
      <head>
	 <style>
body {
  background-color: #efefef;
  background-image: url("images1/cart.jpg");
}
</style> 
           <title>WELCOME TO OUR WEBSITE</title>  
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>  
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />  
           <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
      </head>  
      <body>  
           <br />  
           <div class="container" style="width:500px;">  
                <h1 align="">ONLINE FLAT SELL</h1><br />  
				<h3 align="">For buy a flat or any kind of information, please contact with us.</h3><br /> 
				<h4 align="">Our contact number: 01551244709, 01976410741, 01762374180</h4><br />
				<div class="table-responsive">  
                     <table class="table table-striped">  
                          <tr>  
                               <th>id</th>  
                               <th>district</th>
							   <th>street</th>
							   <th>size</th>
							   <th>prize</th>
							   <th>rooms</th>
							   <th>floors</th>
							   <th>image</th>
							   
							   
                          </tr>
						  
                          <?php  
                          if(mysqli_num_rows($result) > 0)  
                          {  
                               while($row = mysqli_fetch_array($result))  
                               {
							?>	   
                           
                          <tr>  
                               <td><?php echo $row["id"];?></td>  
                               <td><?php echo $row["district"]; ?></td>
							   <td><?php echo $row["street"]; ?></td>
							   <td><?php echo $row["size"]; ?></td>
							   <td><?php echo $row["prize"]; ?></td>
							   <td><?php echo $row["rooms"]; ?></td>
							   <td><?php echo $row["floor"]; ?></td>
							   <td><img src="<?php echo $row["image"]; ?>" class="img-responsive" /> </td>
							   
                          </tr> 
                               
						  
                          <?php  
                               }  
                          }  
                          ?>  
                     </table>  
                </div>  
           </div>  
           <br />
              <h4 align=""><p> Do you want to sell flat? <a href="http://localhost/register/register.php">REGISTER</a></p></h4><br />
			  <h4 align=""><p> Already have an account? <a href="http://localhost/register/login.php">LOGIN</a></p></h4><br />
			  
      </body>  
 </html>  