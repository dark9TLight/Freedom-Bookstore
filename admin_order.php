<?php
	session_start();
	require_once "./functions/admin.php";
	$title = "List order"; // List book
	require_once "./template/header_admin.php";
	require_once "./functions/database_functions.php";
	$conn = db_connect();

	$query = "SELECT * FROM orders ORDER BY date DESC";
	$result = mysqli_query($conn, $query);
	//$result = getAll($conn);



?>


	<table class="table" style="margin-top: 20px">
		<tr>
			<th>Order Id</th>
			<th>Customer Id</th>
			<th>Amount</th>
			<th>Date</th>
			<th>Ship Name</th>
			<th>Ship Address</th>
			<th>Ship City</th>
			<th>Ship Zip Code</th>
			<th>Ship Country</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
		</tr>

		
		<?php 
		
		    while($row = mysqli_fetch_assoc($result)){?>
		<tr>
		  <td><?php echo $row['orderid']; ?></td>
			<td><?php echo $row['customerid']; ?></td>
			<td><?php echo ($row['amount'] + 20); ?></td>
			<td><?php echo $row['date']; ?></td>
			<td><?php echo $row['ship_name']; ?></td>
			<td><?php echo $row['ship_address']; ?></td>
			<td><?php echo $row['ship_city']; ?></td>
			<td><?php echo $row['ship_zip_code']; ?></td>
			<td><?php echo $row['ship_country']; ?></td>
			<td><a style="color: red" href="order_delete.php?orderisbn=<?php echo $row['orderid']; ?>"><button>Delete</button></a></td>

			
		 <td><?php //echo getPubName($conn, $row['categoryid']); ?></td>

			
		</tr>

		<?php } ?>
	</table>

	

	<?php
	
	if(isset($conn)) {mysqli_close($conn);}
	require_once "./template/footer_admin.php";
?>		
	
