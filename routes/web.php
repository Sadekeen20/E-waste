<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/user','providerController@providerlogin');
Route::get('/processor/login','processorController@processorLogin');
Route::post('/processor/loginAction','processorController@processorLoginAction');

Route::get('/admin','employeeController@totalLogin');
Route::get('/admin/createEmployee','employeeController@createEmployee');
Route::get('/admin/show','employeeController@showInfo');
Route::post('/admin/home','employeeController@loginAction');
Route::get('/admin/login','employeeController@login');
Route::get('/admin/otherEmployee','employeeController@otherEmployee');
Route::get('/admin/info','employeeController@info');
Route::get('/admin/researcher','employeeController@getresearcher');
Route::post('/admin/researcher','employeeController@postresearcher');
Route::get('/admin/dumpingemployee','employeeController@dumpingemployee');
Route::get('/admin/addEmployee','employeeController@getaddEmployee');
Route::post('/admin/addEmployee','employeeController@postaddEmployee');
Route::get('/user/ManufacturerReg','providerController@ManufacturerRegister');
route::post('admin/Dump', 'employeeController@dumpingemployee');
Route::post('/user/home','providerController@LoginAction');
Route::post('/user/store','providerController@manufacturerStore');
