<?php
require 'config.php';
if(!empty($_SESSION["id"])){
  $id = $_SESSION["id"];
  $result = mysqli_query($conn, "SELECT * FROM tb_user WHERE id = $id");
  $row = mysqli_fetch_assoc($result);
}
else{
  header("Location: login.php");
}
?>

<!DOCTYPE html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

.column1 {
  border: 2px solid white;
  float: left;
  width: auto;
  top: 100px;
  height: 260px;
  padding-bottom: 30%;
  padding-right: 25px;
  padding-left: 25px;
  background-color: rgb(235, 196, 155);
  position: static;
}
.column1 li a{
	font-size: medium;

}
.column2{
  float: left;
  width: 75%;
  padding: 10px;
  left: 30px;
  padding-left:35px;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>
</head>
<body>
	<?php 
	$title = "Customer Homepage";
	require "./template/header_home.php";
	?>
<div class="row">
  <div class="column1">
    <?php
	//session_start();
	require_once "./functions/database_functions.php";
	$conn = db_connect();

	$query = "SELECT * FROM category ORDER BY categoryid";
	$result = mysqli_query($conn, $query);
	if(!$result){
		echo "Can't retrieve data " . mysqli_error($conn);
		exit;
	}
	if(mysqli_num_rows($result) == 0){
		echo "Empty category ! Something wrong! check again";
		exit;
	}
?>
<p class="lead" style="color:black !important"> Search By Category</p>
	<ul>
	<?php 
		while($row = mysqli_fetch_assoc($result)){
			$count = 0; 
			$query = "SELECT categoryid FROM books";
			$result2 = mysqli_query($conn, $query);
			if(!$result2){
				echo "Can't retrieve data " . mysqli_error($conn);
				exit;
			}
			while ($pubInBook = mysqli_fetch_assoc($result2)){
				if($pubInBook['categoryid'] == $row['categoryid']){
					$count++;
				}
			}
	?>
		<li>
			<span class="badge"></span>
		    <a style="color: saddlebrown" href="bookPerPub.php?pubid=<?php echo $row['categoryid']; ?>"><?php echo $row['category_name']; ?></a>
		</li>
	<?php } 
	?>
	</ul>
  </div>
  <div class="column2">
		<?php
		$row = select4LatestBook($conn);
		?>
			<!-- Example row of columns -->
			<p class="lead text-center text-muted" style="color: black !important">Latest books</p>
			<div class="row">
				<?php foreach($row as $book) { ?>
				<div class="col-md-3">
					<a href="book.php?bookisbn=<?php echo $book['book_id']; ?>">
				<img class="img-responsive img-thumbnail" src="./bootstrap/img/<?php echo $book['book_image']; ?>">
				</a>
				</div>
				<?php } ?>
			</div>
		
	</div>
</div>
</body>
</html>
<?php
	mysqli_close($conn);
	require "./template/footer_home.php";
?>
