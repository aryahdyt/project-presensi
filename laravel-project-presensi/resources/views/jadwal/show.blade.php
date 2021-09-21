@extends('partial.master', ['title' => 'History'])

@section('title')
Jadwal
@endsection

@section('page')
<div class="breadcrumb-item"><a href="{{ route('jadwal.index') }}">Jadwal</a></div>
<div class="breadcrumb-item active">{{ $jadwal->tanggal }}</div>
@endsection

@section('content')

@endsection