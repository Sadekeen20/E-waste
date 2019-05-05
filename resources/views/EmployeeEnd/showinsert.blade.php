@include('header')
<body style="background-image: linear-gradient(-25deg, #FFFFFF 0%, #C0C0C0 100%);">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">E-waste</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="/user/manufacturerinventoryhistory">Inventory History</a></li>
        <li><a href="/user/sellItems">Sell Items</a></li>

    </ul>
  </div>
</nav>

	<div class="limiter">

    <?php
        $vals = DB::connection('oracle')->select("Select * FROM MANUFACTURER WHERE PROVIDER_ID = '$id' "); //write any query you need, I am writing to show the                                                                     //employees information
    ?>
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<table data-vertable="ver1">
						<thead>
							<tr class="row100 head">
								<th class="column100 column1" data-column="column1">Provider ID</th>
								<th class="column100 column2" data-column="column2">Contact Name</th>
								<th class="column100 column3" data-column="column3">Inventory Location</th>
								<th class="column100 column4" data-column="column4">Name</th>
                <th class="column100 column5" data-column="column5">Location</th>


                                <th class="column100 column6" data-column="column6">Email</th>
                                <th class="column100 column7" data-column="column7">Password</th>

							</tr>
						</thead>


						<tbody>

							<tr class="row100">
								<td class="column100 column1" data-column="column1">{{$id}}</td>
								<td class="column100 column2" data-column="column2">{{$loc}}</td>

							</tr>
                          
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
