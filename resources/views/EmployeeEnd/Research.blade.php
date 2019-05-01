@include('header')
<body style="background-image: linear-gradient(-25deg, #FFFFFF 0%, #C0C0C0 100%);">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">E-waste</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#">Home</a></li>
      <li><a href="otherEmployee">Other Employee</a></li>
      <li class="active"><a href="researcher">Researcher</a></li>
      <li><a href="transport">Transport</a></li>
      <li><a href="dumpingemployee">Dumping Stations</a></li>
      <li><a href="#">Recycle Status</a></li>
      <li><a href="addEmployee">Add New Employee</a></li>
    </ul>
  </div>
</nav>

	<div class="limiter">

    <?php
        $vals = DB::connection('oracle')->select("Select * FROM PAPERS WHERE NAME = '$name' "); //write any query you need, I am writing to show the                                                                     //employees information
    ?>
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<table data-vertable="ver1">
						<thead>
							<tr class="row100 head">
								<th class="column100 column1" data-column="column1"></th>
								<th class="column100 column2" data-column="column2">Paper</th>
								<th class="column100 column3" data-column="column3">University</th>
								<th class="column100 column4" data-column="column4">Collaborator</th>
                                <th class="column100 column4" data-column="column5">Funding</th>
							</tr>
						</thead>


						<tbody>
                            @foreach($vals as $val)
							<tr class="row100">
								<td class="column100 column1" data-column="column1">{{$val->name}}</td>
								<td class="column100 column2" data-column="column2">{{$val->university}}</td>
								<td class="column100 column3" data-column="column3">{{$val->collaborator}}</td>
								<td class="column100 column4" data-column="column4">{{$val->paper}}</td>
                                <td class="column100 column4" data-column="column5">{{$val->funding}}</td>
							</tr>
                            @endforeach
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
