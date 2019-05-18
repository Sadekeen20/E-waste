<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use DB;
class employeeController extends Controller
{

  //this part will be done by riday.
  //here are some template code for different cases
  //There must be a login page and an info page.
  //then for insertions and showing data in any view make as many page as needed
  //using Route::get('/employee/*****',.....);

  /*  public function test()
  {
  $users = DB::connection('oracle')->select('select * from Provider'); //this is the prototype for select query.
  $user = $users[0]->id; //here 0 is the index and id is the name of column in the database.
  var_dump($user);
  $id1 = '123';
  $name = 'name';
  $users = DB::connection('oracle')->insert("INSERT INTO Provider VALUES('$id1','$name')");//this is for inserting data
} */

//start copy here
//you have to copy this function, rename tablename with the name of your table.
// public function tablename()
// {
//      return view('Tables.tablename');//change tablename to your entity name
// }

// //you have to copy this function and rename the store part with the name of your table.
// public function tablenamestore()
// {
//  $input1= request("input1");
//  $input2= request("input2");
//  $input3= request("input3");
//  $users = DB::connection('oracle')->insert("INSERT INTO Provider VALUES('$input1','$input2','$input3')");//this is for inserting data
//  //Redirecting code
//  return redirect('tablenamedata');//change the tablename to your entity name;
// }

// //copy this function and change data to the file you have created.
// public function tablenameindex()
// {
//     return view('Tables.tablenamedata'); //change tablename to your entity name.
// }

//end copy here

public function loginAction(Request $request)
{
  $email = request("email");//get value from page
  $pass = request("password");//get value from page

  $check = DB::connection('oracle')->select("Select DISTINCT EMPLOYEE_ID,ACCESSLEVEL FROM EMPLOYEE WHERE email = '$email' AND password = '$pass'");//check if correct password

  if(count($check) != 0)
  {
    $ID = $check[0]->employee_id;
    $level = $check[0]->accesslevel;
    $request->session()->put('id', $ID);
    $request->session()->put('level', $level);
    return view('EmployeeEnd.Info',['id' => $ID , 'level' => $level]);
  }
  else {
    return view('EmployeeEnd.LoginForm');
  }
}
public function login()
{
  return view('EmployeeEnd.LoginForm');
}
public function checkEmployee(Request $request)
{
  return view('EmployeeEnd.EmployeeCheck',['id' => $request->session()->get('id'), 'level' => $request->session()->get('level')]);
}
public function info(Request $request)
{
  return view('EmployeeEnd.Info',['id' => $request->session()->get('id'), 'level' => $request->session()->get('level')]);
}
public function researchStatus(Request $request)
{
  return view('EmployeeEnd.Research',['id' => $request->session()->get('id'), 'level' => $request->session()->get('level')]);
}
public function getaddEmployee(Request $request)
{
  return view('EmployeeEnd.EmployeeAdd',['id' => $request->session()->get('id'), 'level' => $request->session()->get('level')]);
}

public function postaddEmployee(Request $request)
{
  $id = $request->session()->get('id');
  $check = DB::connection('oracle')->select("Select ACCESSLEVEL FROM EMPLOYEE WHERE EMPLOYEE_ID = '$id'");
  if(count($check) == 1 & $check[0]->accesslevel == 2)
  {
    $name = request("name");
    $phone = request("phone");
    $salary = request("salary");
    $age = request("age");
    $email = request("email");
    $password = request("password");
    $access = request("access");

    $users = DB::connection('oracle')->insert("INSERT INTO Employee VALUES('','$phone','$name',$salary,$age,'$email','$password',$access,'free')");

    return view('EmployeeEnd.Info',['id' => $request->session()->get('id')]);
  }
  else {
    return view('EmployeeEnd.EmployeeAdd',['id' => $request->session()->get('id')]);
  }
}

public function getaddTransport(Request $request, $val)
{
  return view('EmployeeEnd.TransportAdd',['id' => $request->session()->get('id'), 'level' => $request->session()->get('level') , 'id2' => $val]);
}

public function postaddTransport(Request $request)
{
  $vehicle_license = request("vehicle_license");
  $vehicle_capacity = request("vehicle_capacity");
  $vehicle_type = request("vehicle_type");
  $destination = request("destination");
  $id = request("pk");
  $users = DB::connection('oracle')->insert("INSERT INTO TRANSPORT VALUES('$id','$vehicle_license','$vehicle_capacity','$vehicle_type','$destination','')");
  return view('EmployeeEnd.Info',['id' => $request->session()->get('id'), 'level' => $request->session()->get('level')]);
}

public function getaddResearch(Request $request, $val)
{
  return view('EmployeeEnd.ResearchAdd',['id' => $request->session()->get('id'), 'level' => $request->session()->get('level') , 'id2' => $val]);
}

public function postaddResearch(Request $request)
{
  $topic = request("topic");
  $funding = request("funding");
  $degree = request("degree");
  $id = request("pk");
  $users = DB::connection('oracle')->insert("INSERT INTO Research VALUES('$id','$topic','$degree',$funding)");
  return view('EmployeeEnd.Info',['id' => $request->session()->get('id'), 'level' => $request->session()->get('level')]);
}

public function getaddDisassembler(Request $request, $val)
{
  return view('EmployeeEnd.DisassemblerAdd',['id' => $request->session()->get('id'), 'level' => $request->session()->get('level') , 'id2' => $val]);
}

public function postaddDisassembler(Request $request)
{
  $type = request("type");
  $id = request("pk");
  $users = DB::connection('oracle')->insert("INSERT INTO DISSEMBLER VALUES('$id','$type')");
  return view('EmployeeEnd.Info',['id' => $request->session()->get('id'), 'level' => $request->session()->get('level')]);
}

public function removeResearch(Request $request,$id)
{
  $name = request("name");
  $del = DB::connection('oracle')->delete("DELETE FROM RESEARCH WHERE EMPLOYEE_ID = $id");
  return view('EmployeeEnd.EmployeeCheck',['name' => $name, 'id' => $request->session()->get('id'), 'level' => $request->session()->get('level')]);
}

public function removeTransport(Request $request,$id)
{
  $name = request("name");
  $del = DB::connection('oracle')->delete("DELETE FROM TRANSPORT WHERE EMPLOYEE_ID = $id");
  return view('EmployeeEnd.EmployeeCheck',['name' => $name, 'id' => $request->session()->get('id'), 'level' => $request->session()->get('level')]);
}

public function removeDisassembler(Request $request,$id)
{
  $name = request("name");
  $del = DB::connection('oracle')->delete("DELETE FROM DISSEMBLER WHERE EMPLOYEE_ID = $id");
  return view('EmployeeEnd.EmployeeCheck',['name' => $name, 'id' => $request->session()->get('id'), 'level' => $request->session()->get('level')]);
}

public function worktransport(Request $request)
{
  return view('EmployeeEnd.TransportWorking',['id' => $request->session()->get('id'), 'level' => $request->session()->get('level')]);
}

public function workdone(Request $request)
{
  $id = $request->session()->get('id');
  $trans = DB::connection('oracle')->select("SELECT * FROM TRANSPORT WHERE EMPLOYEE_ID = '$id'");
  if(count($trans) == 1)
  {
    $barcodes = DB::connection('oracle')->select("SELECT BARCODE,CONDITION,LOCATION FROM NEW_ADD WHERE EMPLOYEE = '$id'");
    foreach($barcodes as $barcode)
    {
      $bar = $barcode->barcode;
      $check = DB::connection('oracle')->select("SELECT * FROM INVENTORY WHERE BARCODE = '$bar'");
      if(count($check) == 0)
      {
        $cond = $barcode->condition;
        $loc = $barcode->location;
        $ins = DB::connection('oracle')->insert("INSERT INTO INVENTORY VALUES(INVENTORY_ID_SEQ.nextval,'$id','',SYSDATE,'','$loc','$cond','$bar')");
      }
    }
  }
  else {
    $trans = DB::connection('oracle')->select("SELECT * FROM DISSEMBLER WHERE EMPLOYEE_ID = '$id'");
    $prod = $trans[0]->product_type;
    $get = DB::connection('oracle')->select("SELECT * FROM RECYCLER WHERE SPECIALIZATION = '$prod'");
    $proc = $get[0]->processor_id;
    $ins = DB::connection('oracle')->insert("INSERT INTO RECYCLING VALUES('$id','$proc')");
  }
  $trans = DB::connection('oracle')->update("UPDATE EMPLOYEE SET STATUS = 'free' WHERE EMPLOYEE_ID = '$id'");
  return view('EmployeeEnd.Info',['id' => $request->session()->get('id'), 'level' => $request->session()->get('level')]);
}
public function showLog(Request $request)
{
  return view('EmployeeEnd.Log',['id' => $request->session()->get('id')]);
}

public function currentTask(Request $request)
{
  return view('EmployeeEnd.currentTasks',['id' => $request->session()->get('id')]);
}

public function updateEmployee(Request $request)
{
  return view('EmployeeEnd.updateEmployee',['id' => $request->session()->get('id')]);
}

public function removeEmployee(Request $request, $val)
{
  $del = DB::connection('oracle')->delete("DELETE FROM EMPLOYEE WHERE EMPLOYEE_ID = '$val'");
  return view('EmployeeEnd.Info',['id' => $request->session()->get('id')]);
}

public function updateEmployeeForm(Request $request, $val)
{
  return view('EmployeeEnd.updateEmployeeForm',['id' => $request->session()->get('id') , 'pk' => $val]);
}

public function updateEmployeeAction(Request $request)
{
  $id = $request->session()->get('id');
  $check = DB::connection('oracle')->select("Select ACCESSLEVEL FROM EMPLOYEE WHERE EMPLOYEE_ID = '$id'");
  if(count($check) == 1 & $check[0]->accesslevel == 2)
  {
    $name = request("name");
    $phone = request("phone");
    $salary = request("salary");
    $age = request("age");
    $email = request("email");
    $password = request("password");
    $access = request("access");
    $id = request("pk");
    $users = DB::connection('oracle')->update("UPDATE Employee SET NAME = '$name', PHONE_NUMBER = '$phone',
      SALARY = '$salary' , AGE = '$age', ACCESSLEVEL = $access, Password = '$password', EMAIL = '$email' WHERE EMPLOYEE_ID = '$id'");
      return view('EmployeeEnd.Info',['id' => $request->session()->get('id')]);
    }
    else {
      return view('EmployeeEnd.Info',['id' => $request->session()->get('id')]);
    }
  }

  public function updateSelf(Request $request)
  {
    return view('EmployeeEnd.updateSelf',['id' => $request->session()->get('id')]);
  }

  public function updateSelfAction(Request $request)
  {
    $id = $request->session()->get('id');
    $name = request("name");
    $phone = request("phone");
    $email = request("email");
    $password = request("password");
    $users = DB::connection('oracle')->update("UPDATE Employee SET NAME = '$name', PHONE_NUMBER = '$phone',
      Password = '$password', EMAIL = '$email' WHERE EMPLOYEE_ID = '$id'");
      return view('EmployeeEnd.Info',['id' => $request->session()->get('id')]);
  }

  public function researchadd(Request $request)
  {
    return view('EmployeeEnd.NewResearch',['id' => $request->session()->get('id')]);
  }

  public function researchaddAction(Request $request)
  {
    $id = $request->session()->get('id');
    $uni_name = request("uni_name");
    $phone = request("phone");
    $email = request("email");
    $loc = request("location");
    $pub_name = request("name");
    $users = DB::connection('oracle')->insert("INSERT INTO COLLABORATION VALUES('','$pub_name','$loc','$uni_name','$email','$phone')");
    $final = DB::connection('oracle')->insert("INSERT INTO COLLABORATES  VALUES('PUBLISHER_ID_SEQ.CURRVAL','$id')");
    return view('EmployeeEnd.NewResearch',['id' => $request->session()->get('id')]);
  }

  public function paperaddAction(Request $request)
  {
    $id = $request->session()->get('id');
    $pub_name = request("name");
    $final = DB::connection('oracle')->insert("INSERT INTO PAPER_TABLE VALUES('$id','$pub_name')");
    return view('EmployeeEnd.NewResearch',['id' => $request->session()->get('id')]);
  }

  public function status(Request $request)
  {
    return view('EmployeeEnd.Status',['id' => $request->session()->get('id')]);
  }
}
