<div class="navbar-bg"></div>
<nav class="navbar navbar-expand-lg main-navbar">
    <form class="form-inline mr-auto">
        <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a></li>
        </ul>
    </form>
    <ul class="navbar-nav navbar-right">
        {{-- <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown"
                class="nav-link nav-link-lg message-toggle {{ ($jadwal_kelas) ? 'beep' : '' }}"><i
            class="far fa-envelope"></i></a>
        <div class="dropdown-menu dropdown-list dropdown-menu-right">
            <div class="dropdown-header">Messages
                <div class="float-right">
                    <a href="">Mark All As Read</a>
                </div>
            </div>
            <div class="dropdown-list-content dropdown-list-message">
                <a href="" class="dropdown-item">
                    <div class="dropdown-item-desc">
                        <b>{{ $jadwal_kelas->tanggal() }}</b>
                        <p>Absen Matapelajaran : {{ $jadwal_kelas->mapel->mapel }}</p>
                    </div>
                </a>
            </div>
            <div class="dropdown-footer text-center">
                <a href="">View All <i class="fas fa-chevron-right"></i></a>
            </div>
        </div>
        </li> --}}
        <li class="dropdown"><a href="#" data-toggle="dropdown"
                class="nav-link dropdown-toggle nav-link-lg nav-link-user btn btn-light text-primary rounded-pill">
                <div class="d-sm-none d-lg-inline-block">Hi, {{ Auth::user()->name }}</div>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <a href="" class="dropdown-item has-icon">
                    <i class="far fa-user"></i> Profile
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item has-icon text-danger" href="{{ route('logout') }}" onclick="event.preventDefault();
                document.getElementById('logout-form').submit();">
                    <i class="fas fa-sign-out-alt"></i>{{ __('Logout') }}
                </a>

                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                    @csrf
                </form>
            </div>
        </li>
    </ul>
</nav>