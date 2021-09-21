@extends('partial.master', ['title' => 'History'])

@section('title')
History Absen {{ $history->siswa->nama_lengkap }}
@endsection

@section('page')
<div class="breadcrumb-item"><a href="{{ route('history.index') }}">History</a></div>
<div class="breadcrumb-item active">{{ $history->tanggal() }}</div>
@endsection

@section('content')

@endsection