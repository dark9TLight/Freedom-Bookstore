<?php
	session_start();
	require_once "./functions/admin.php";
	$title = "List book";
	require_once "./template/header_admin.php";
	require_once "./functions/database_functions.php";
	$conn = db_connect();
	$result = getAll($conn);
?>
	<table class="table" style="margin-top: 20px">
		<tr>
			<th>Id</th>
			<th>Title</th>
			<th>Author</th>
			<th>Image</th>
			<th>Description</th>
			<th>Price (RM)</th>
			<th>Category</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
		</tr>
		<?php while($row = mysqli_fetch_assoc($result)){ ?>
		<tr>
			<td><?php echo $row['book_id']; ?></td>
			<td><?php echo $row['book_title']; ?></td>
			<td><?php echo $row['book_author']; ?></td>
			<td><?php echo $row['book_image']; ?></td>
			<td><?php echo $row['book_descr']; ?></td>
			<td><?php echo $row['book_price']; ?></td>
			<td><?php echo getPubName($conn, $row['categoryid']); ?></td>
			<td><a style="color: orange" href="admin_edit.php?bookisbn=<?php echo $row['book_id']; ?>"><button>Edit</button></a></td>
			<td><a style="color: red" href="admin_delete.php?bookisbn=<?php echo $row['book_id']; ?>"><button>Delete</button></a></td>
		</tr>
		<?php } ?>
	</table>

<?php
	if(isset($conn)) {mysqli_close($conn);}
	require_once "./template/footer_admin.php";
?>