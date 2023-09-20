<?php

use App\Http\Controllers\V1\AddOnServicesController;
use App\Http\Controllers\V1\AuthenticateController;
use App\Http\Controllers\V1\ImagesController;
use App\Http\Controllers\V1\RoomsController;
use App\Http\Controllers\V1\RoomTypesController;
use App\Http\Controllers\V1\ServicesController;
use App\Http\Controllers\V1\UserTypesController;
use App\Http\Controllers\V1\RoomReservationController;
use App\Http\Controllers\V1\TransactionController;
use App\Services\SearchAvailable;
use Illuminate\Support\Facades\Route;

//////////////////////////// RoomTypes ////////////////////////////
// private routes
Route::apiResource('roomtypes', RoomTypesController::class)
      ->only(['store', 'destroy', 'update'])
      ->middleware(['auth:sanctum', 'role:admin,stuff']);
// public routes of roomtypes
Route::apiResource('roomtypes', RoomTypesController::class)
     ->only(['index', 'show']);




//////////////////////////// Images ////////////////////////////
Route::apiResource('images', ImagesController::class)
      ->only(['store', 'destroy', 'update'])
      ->middleware(['auth:sanctum', 'role:admin,stuff']);
// public routes of images
Route::apiResource('images', ImagesController::class)
      ->only(['index', 'show']);


//////////////////////////// Add On Services ////////////////////////////
//Private Routes Of Add On Services
Route::apiResource('add_on_service_roomtypes', AddOnServicesController::class)
      ->only(['store', 'destroy', 'update'])
      ->middleware(['auth:sanctum', 'role:admin']);
//Public Routes of Add On Services
Route::apiResource('add_on_service_roomtypes', AddOnServicesController::class)
      ->only('index', 'show');




//////////////////////////////// Services ////////////////////////////
// Private Routes Of Services
Route::apiResource('services', ServicesController::class)
->only(['store', 'update', 'destroy'])
->middleware(['auth:sanctum', 'role:admin,stuff']);
// Public Routes of services
Route::apiResource('services', ServicesController::class)
->only(['index', 'show']);



//////////////////////////// Role ////////////////////////////
Route::apiResource('usertypes', UserTypesController::class)->middleware(['auth:sanctum', 'role:admin']);


//////////////////////////// Room ////////////////////////////
Route::apiResource('rooms', RoomsController::class)
      ->only(['store', 'update', 'destroy'])
      ->middleware(['auth:sanctum', 'role:admin']);
Route::apiResource('rooms', RoomsController::class)->only(['index', 'show']);




//////////////////////////// Room Reservations ////////////////////////////
Route::apiResource('room_reservations', RoomReservationController::class);





//////////////////////////// Transactions ////////////////////////////
Route::apiResource('transactions', TransactionController::class)->middleware('auth:sanctum');




/**
 * special routes, public routes
 */
Route::get('reservations/searchAvailable', [SearchAvailable::class, 'searchAvailable']);
Route::post('reservations/addBooking/searchAvailable', [SearchAvailable::class, 'searchAvailable']);





//////////////// AUTHENTICATE //////////////
// public routes
Route::post('/register', [AuthenticateController::class, 'register']);
Route::post('/login', [AuthenticateController::class, 'login']);
// private route
Route::post('/logout', [AuthenticateController::class, 'logout'])->middleware('auth:sanctum');