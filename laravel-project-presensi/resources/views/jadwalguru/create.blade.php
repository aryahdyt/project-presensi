@extends('partial.master')

@section('page')
<div class="breadcrumb-item"><a href="{{ route('jadwalguru.index') }}">Jadwal</a></div>
<div class="breadcrumb-item active">Tambah</div>
@endsection

@section('title')
Tambah Jadwal
@endsection

@section('content')
@section('content')
<div class="row">
  <div class="col-12">
    <div class="card p-5">
      <form method="POST" action="{{ route('jadwalguru.store') }}">
        @csrf
        <div class="form-group row mb-2 mx-5">
          <label for="nama" class="col-form-label text-md-right col-12 col-md-3 col-lg-3 text-dark">
            Kelas
          </label>
          <div class="col-sm-12 col-md-7">
            <select name="kelas_id" class="form-control">
              <option value="" disabled>&mdash; Pilih &mdash;</option>
              @foreach ($kelas as $item)
              <option value="{{ $item->id }}">{{ $item->kelas }}</option>
              @endforeach
            </select>
          </div>
        </div>

        <div class="form-group row mb-2 mx-5">
          <label for="nama" class="col-form-label text-md-right col-12 col-md-3 col-lg-3 text-dark">
            Kelas
          </label>
          <div class="col-sm-12 col-md-7">
            <select name="mapel_id" class="form-control">
              <option value="" disabled>&mdash; Pilih &mdash;</option>
              @foreach ($mapel as $item)
              <option value="{{ $item->id }}">{{ $item->mapel }} &mdash; {{ $item->kode_mapel }}</option>
              @endforeach
            </select>
          </div>
        </div>

        <div class="form-group row mb-2 mx-5">
          <label for="nama" class="col-form-label text-md-right col-12 col-md-3 col-lg-3 text-dark">
            Tanggal
          </label>
          <div class="col-sm-12 col-md-7">
            <input type="date" class="form-control" name="tanggal" id="tanggal" value="{{ old('tanggal', '') }}"
              required>
          </div>
        </div>
        <div class="form-group row mb-2 mx-5">
          <label for="nama" class="col-form-label text-md-right col-12 col-md-3 col-lg-3 text-dark">
            Jam Masuk
          </label>
          <div class="col-sm-12 col-md-7">
            <input type="time" class="form-control" name="jam_masuk" id="jam_masuk" value="{{ old('jam_masuk', '') }}"
              required>
          </div>
        </div>
        <div class="form-group row mb-2 mx-5">
          <label for="nama" class="col-form-label text-md-right col-12 col-md-3 col-lg-3 text-dark">
            Jam Keluar
          </label>
          <div class="col-sm-12 col-md-7">
            <input type="time" class="form-control" name="jam_keluar" id="jam_keluar"
              value="{{ old('jam_keluar', '') }}" required>
          </div>
        </div>

        <div class="row mt-3">
          <!-- /.col -->
          <div class="col-4 m-auto">
            <a href="javascript:void(0)" onclick="window.history.back();" class="btn btn-outline-primary"><i
                class="fas fa-arrow-left"></i></a>
            <button type="reset" class="btn btn-danger">
              <i class="fas fa-redo"></i>
            </button>
            <button type="submit" class="btn btn-primary">
              {{ __('Tambah') }}
            </button>
          </div>
          <!-- /.col -->
        </div>
      </form>
    </div>
  </div>
</div>
@endsection