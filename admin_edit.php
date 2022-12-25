<?php
	session_start();
	require_once "./functions/admin.php";
	$title = "Edit book";
	require_once "./template/header_admin.php";
	require_once "./functions/database_functions.php";
	$conn = db_connect();

	if(isset($_GET['bookisbn'])){
		$book_id = $_GET['bookisbn'];
	} else {
		echo "Empty query!";
		exit;
	}

	if(!isset($book_id)){
		echo "Empty isbn! check again!";
		exit;
	}

	// get book data
	$query = "SELECT * FROM books WHERE book_id = '$book_id'";
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo "Can't retrieve data " . mysqli_error($conn);
		exit;
	}
	$row = mysqli_fetch_assoc($result);
?>
	<form method="post" action="edit_book.php" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<th>Id</th>
				<td><input class="form-control" style="width: 196px;" type="text" name="isbn" value="<?php echo $row['book_id'];?>" readOnly="true"></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input class="form-control" style="width: 196px;"  type="text" name="title" value="<?php echo $row['book_title'];?>" readOnly="true" ></td>
			</tr>
			<tr>
				<th>Author</th>
				<td><input  class="form-control" style="width: 196px;" type="text" name="author" value="<?php echo $row['book_author'];?>"  readOnly="true"></td>
			</tr>
			<tr>
				<th>Image</th>
				<td><input type="file" name="image"></td>
			</tr>
			<tr>
				<th>Description</th>
				<td><textarea  class="form-control" style="width: 396px;" name="descr" cols="40" rows="5"><?php echo $row['book_descr'];?></textarea>
			</tr>
			<tr>
				<th>Price (RM)</th>
				<td><input  class="form-control" style="width: 196px;" type="text" name="price" value="<?php echo $row['book_price'];?>" required></td>
			</tr>
			<tr>
				<th>Category</th>
				<td><input  class="form-control" style="width: 196px;" type="text" name="category" value="<?php echo getPubName($conn, $row['categoryid']); ?>" readOnly="true"></td>
			</tr>
		</table>
		<input type="submit" name="save_change" value="Change" class="btn btn-primary">
		<a href="admin_book.php" class="btn btn-success">Back to booklist</a>
	</form>
	<br/>
<?php
	if(isset($conn)) {mysqli_close($conn);}
	require "./template/footer_admin.php"
?>