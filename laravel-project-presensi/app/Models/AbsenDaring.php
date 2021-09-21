<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AbsenDaring extends Model
{
    use HasFactory;

    protected $fillable = [
        'siswa_id',
        'kelas_id',
        'jadwal_id',
        'pembahasan',
        'kehadiran',
        'bukti',
    ];

    protected $with = ['siswa', 'kelas', 'jadwal'];

    public function siswa()
    {
        return $this->belongsTo(Siswa::class);
    }

    public function kelas()
    {
        return $this->belongsTo(Kelas::class);
    }

    public function jadwal()
    {
        return $this->belongsTo(Jadwal::class);
    }

    public function tanggal()
    {
        return Carbon::parse($this->jadwal->tanggal)->format('l, d F Y');
    }
}
