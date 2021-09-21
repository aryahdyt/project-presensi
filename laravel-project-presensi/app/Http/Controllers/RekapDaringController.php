<?php

namespace App\Http\Controllers;

use App\Models\AbsenDaring;
use App\Models\Jadwal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RekapDaringController extends Controller
{
    public function indexJadwal()
    {
        $jadwal = Jadwal::select('id', 'tanggal', 'mapel_id', 'kelas_id')->where('guru_id', Auth::user()->guru->id)->with('mapel', 'kelas')->latest()->get();
        // dd($jadwal);
        return view('rekapdaring.indexJadwal', [
            'jadwal' => $jadwal
        ]);
    }

    public function indexRekap($id)
    {
        $absen = AbsenDaring::select()->where('jadwal_id', $id)->with('siswa', 'kelas')->get();
        // dd($absen);
        return view('rekapdaring.indexRekap', [
            'absen' => $absen
        ]);
    }
}
