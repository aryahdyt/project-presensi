<?php

use Illuminate\Support\Facades\{Route, Auth};
use App\Http\Controllers\{
    HomeController,
    DashboardController,
    AbsenDaringController,
    HistoryController,
    JadwalController,
    JadwalGuruController,
    RekapDaringController
};
use TCG\Voyager\Facades\Voyager;

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


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Auth::routes();
Route::get('/erorRole', function () {
    return view('eror.500');
});

Route::group(['middleware' => ['auth', 'CekRole:3,4']], function () {
    Route::get('/', DashboardController::class)->name('dashboard');
});

Route::group(['middleware' => ['auth', 'CekRole:3']], function () {
    // Route::get('/', DashboardController::class)->name('dashboard');

    Route::group(['prefix' => 'absen'], function () {
        Route::get('', [AbsenDaringController::class, 'create'])->name('absen.create');
        Route::post('', [AbsenDaringController::class, 'store'])->name('absen.store');
    });

    Route::prefix('history')->group(function () {
        Route::get('', [HistoryController::class, 'index'])->name('history.index');
        Route::get('{history}', [HistoryController::class, 'show'])->name('history.show');
    });

    Route::prefix('jadwal')->group(function () {
        Route::get('', [JadwalController::class, 'index'])->name('jadwal.index');
        Route::get('{jadwal}', [JadwalController::class, 'show'])->name('jadwal.show');
    });
});

Route::group(['middleware' => ['auth', 'CekRole:4']], function () {
    // Route::get('/', DashboardController::class)->name('dashboard');

    Route::prefix('jadwalguru')->group(function () {
        Route::get('', [JadwalGuruController::class, 'index'])->name('jadwalguru.index');
        Route::get('tambah', [JadwalGuruController::class, 'create'])->name('jadwalguru.create');
        Route::post('tambah', [JadwalGuruController::class, 'store'])->name('jadwalguru.store');
        Route::get('{jadwal}', [JadwalGuruController::class, 'show'])->name('jadwalguru.show');
    });

    Route::prefix('rekapdaring')->group(function () {
        Route::get('jadwal', [RekapDaringController::class, 'indexJadwal'])->name('rekapdaring.indexJadwal');
        Route::get('jadwal/{id}', [RekapDaringController::class, 'indexRekap'])->name('rekapdaring.indexRekap');
    });
});
