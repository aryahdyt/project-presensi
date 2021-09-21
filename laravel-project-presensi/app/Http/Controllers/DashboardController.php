<?php

namespace App\Http\Controllers;

use App\Models\Guru;
use App\Models\Siswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke()
    {
        // dd(Auth::user()->role_id);
        $user_id = Auth::user()->id;

        if (Auth::user()->role_id === 3) {
            $siswa = Siswa::where('user_id', $user_id)->first();
            return view('dashboard.siswa', [
                'siswa' => $siswa,
            ]);
        } elseif (Auth::user()->role_id === 4) {
            $guru = Guru::where('user_id', $user_id)->first();
            return view('dashboard.guru', [
                'guru' => $guru,
            ]);
        }
    }
}
