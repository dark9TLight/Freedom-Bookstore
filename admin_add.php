<?php
	session_start();
	require_once "./functions/admin.php";
	$title = "Add new book";
	require "./template/header_admin.php";
	require "./functions/database_functions.php";
	$conn = db_connect();

	$query = "SELECT * FROM books order by book_id desc limit 1";
	$result = mysqli_query($conn, $query);
	$row = mysqli_fetch_assoc($result);
	$lastid = $row['book_id'];
	if ($lastid==""){
		$bookid="001";
	}
	else if($lastid=="001"||$lastid=="002"||$lastid=="003"||$lastid=="004"||$lastid=="005"||$lastid=="006"||$lastid=="007"||$lastid=="008"){
		$bookid=substr($lastid,2);
		$bookid=intval($bookid);
		$bookid="00".($bookid+1);
	}
	else {
		
		$bookid=substr($lastid,1);
		$bookid=intval($bookid);
		$bookid="0".($bookid+1);
	
	}




	if(isset($_POST['add'])){
		$isbn = trim($_POST['isbn']);
		$isbn = mysqli_real_escape_string($conn, $isbn);
		
		$title = trim($_POST['title']);
		$title = mysqli_real_escape_string($conn, $title);

		$author = trim($_POST['author']);
		$author = mysqli_real_escape_string($conn, $author);
		
		$descr = trim($_POST['descr']);
		$descr = mysqli_real_escape_string($conn, $descr);
		
		$price = floatval(trim($_POST['price']));
		$price = mysqli_real_escape_string($conn, $price);
		
		$category = trim($_POST['category']);
		$category = mysqli_real_escape_string($conn, $category);

		// add image
		if(isset($_FILES['image']) && $_FILES['image']['name'] != ""){
			$image = $_FILES['image']['name'];
			$directory_self = str_replace(basename($_SERVER['PHP_SELF']), '', $_SERVER['PHP_SELF']);
			$uploadDirectory = $_SERVER['DOCUMENT_ROOT'] . $directory_self . "bootstrap/img/";
			$uploadDirectory .= $image;
			move_uploaded_file($_FILES['image']['tmp_name'], $uploadDirectory);
		}

		// find category and return pubid
		// if category is not in db, create new
		$findPub = "SELECT * FROM category WHERE category_name = '$category'";
		$findResult = mysqli_query($conn, $findPub);
		if(!$findResult){
			// insert into category table and return id
			$insertPub = "INSERT INTO category(category_name) VALUES ('$category')";
			$insertResult = mysqli_query($conn, $insertPub);
			if(!$insertResult){
				echo "Can't add new category " . mysqli_error($conn);
				exit;
			}
			$categoryid = mysql_insert_id($conn);
		} else {
			$row = mysqli_fetch_assoc($findResult);
			$categoryid = $row['categoryid'];
		}


		$query = "INSERT INTO books VALUES ('" . $isbn . "', '" . $title . "', '" . $author . "', '" . $image . "', '" . $descr . "', '" . $price . "', '" . $categoryid . "')";
		$result = mysqli_query($conn, $query);
		if(!$result){
			echo "Can't add new data " . mysqli_error($conn);
			exit;
		} else {
			header("Location: admin_book.php");
		}
	}
?>
	<form method="post" action="admin_add.php" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<th>Id</th>
				<td><input  class="form-control" type="text" name="isbn"style="width: 196px;" value="<?php echo $bookid;?>" readOnly="true"></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input  class="form-control" type="text" name="title" style="width: 196px;"required></td>
			</tr>
			<tr>
				<th>Author</th>
				<td><input  class="form-control" type="text" name="author" style="width: 196px;"required></td>
			</tr>
			<tr>
				<th>Image</th>
				<td><input   type="file" name="image"></td>
			</tr>
			<tr>
				<th>Description</th>
				<td><textarea  class="form-control" name="descr" cols="40" rows="5"style="width: 396px;"></textarea></td>
			</tr>
			<tr>
				<th>Price (RM)</th>
				<td><input class="form-control"  type="text" name="price" style="width: 196px;"required></td>
			</tr>
			<tr>
				<th>Category</th>
				<td>

				<select class="form-control" name="category" style="width: 196px;"required>
				<option type="text">Novel</option>
				<option type="text">Non Fiction</option>
				<option type="text">Comic</option>
				<option type="text">Recipe</option>
				<option type="text">Study</option>
				</select></td>
			</tr>
		</table>
		<input type="submit" name="add" value="Add new book" class="btn btn-primary" >
		<a href="admin_book.php" class="btn btn-success">Cancel</a>
	</form>
	<br/>
<?php
	if(isset($conn)) {mysqli_close($conn);}
	require_once "./template/footer_admin.php";
?>