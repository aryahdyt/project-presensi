<?php

namespace App\Http\Controllers;

use App\Models\Guru;
use App\Models\Jadwal;
use App\Models\Kelas;
use App\Models\Mapel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class JadwalGuruController extends Controller
{
    public function index()
    {
        // $user_id = Auth::user()->id;
        // $guru = Guru::where('user_id', $user_id)->first();

        $jadwal = Jadwal::where('guru_id', Auth::user()->guru->id)->with('mapel', 'kelas', 'guru')->latest()->get();
        // dd($jadwal_coll);

        return view('jadwalguru.index', [
            'jadwal' => $jadwal
        ]);
    }

    public function show(Jadwal $jadwal)
    {
        dd($jadwal->id);
    }

    public function create()
    {
        $kelas = Kelas::select('id', 'kelas')->get();
        $mapel = Mapel::select('id', 'kode_mapel', 'mapel')->get();

        return view('jadwalguru.create', [
            'kelas' => $kelas,
            'mapel' => $mapel
        ]);
    }

    public function store(Request $req)
    {
        // dd($req->all(), Auth::user()->guru->id);

        $jadwal = Jadwal::create([
            'guru_id' => Auth::user()->guru->id,
            'tanggal' => $req->tanggal,
            'kelas_id' => $req->kelas_id,
            'mapel_id' => $req->mapel_id,
            'jam_masuk' => $req->jam_masuk,
            'jam_keluar' => $req->jam_keluar,
        ]);

        return redirect()->route('dashboard')->with('success', 'Anda Sudah Membuat Jadwal.');
    }
}
