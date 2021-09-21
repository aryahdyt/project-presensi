<?php

namespace App\Http\Controllers;

use App\Models\Jadwal;
use App\Models\Mapel;
use App\Models\Siswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class JadwalController extends Controller
{
    public function index()
    {
        $user_id = Auth::user()->id;
        $kelas_siswa = Siswa::where('user_id', $user_id)->first();
        $jadwal = Jadwal::where('kelas_id', $kelas_siswa->kelas_id)->without('mapel', 'kelas', 'guru')->latest()->get();

        // $mapel = Mapel::without('jadwal')->get();
        // dd($mapel);


        return view('jadwal.index', [
            'jadwal' => $jadwal,
        ]);
    }

    public function show(Jadwal $jadwal)
    {
        return view('jadwal.show', ['jadwal' => $jadwal]);
    }
}
