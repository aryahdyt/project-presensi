<div class="main-sidebar">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            <a href="">{{ config('app.name') }}</a>
        </div>
        <div class="sidebar-brand sidebar-brand-sm">
            <a href="">
                <img src="{{ asset('assets/img/logo/logo_tb.png') }}" alt="SMK TARUNA BHAKTI" width="50px">
            </a>
        </div>
        <ul class="sidebar-menu">
            @if (auth()->user()->role_id === 3)
            <li class="menu-header">Dashboard</li>
            <li class="{{ request()->is('/') ? 'active' : '' }}"><a class="nav-link" href="{{ route('dashboard') }}">
                    <i class="fas fa-fire"></i></i>
                    <span>Dashboard</span></a>
            </li>

            <li class="menu-header">Content</li>
            <li class="nav-item dropdown {{ request()->is('absen*','history*') ? 'active' : '' }}">
                <a href="#" class="nav-link has-dropdown" data-toggle="dropdown"><i class="fas fa-address-book"></i>
                    <span>Absen Daring</span></a>
                <ul class="dropdown-menu">
                    <li class="{{ request()->is('absen*') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('absen.create') }}">
                            <i class="fas fa-check"></i>
                            Absen
                        </a>
                    </li>
                    <li class="{{ request()->is('history*') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('history.index') }}">
                            <i class="fas fa-history"></i>
                            History
                        </a>
                    </li>
                </ul>
            </li>

            <li class="menu-header">Jadwal</li>
            <li class="{{ request()->is('jadwal*') ? 'active' : '' }}"><a class="nav-link"
                    href="{{ route('jadwal.index') }}">
                    <i class="fas fa-file"></i></i>
                    <span>Jadwal</span></a>
            </li>

            @elseif (auth()->user()->role_id === 4)
            {{-- sidebar guru --}}
            <li class="menu-header">Dashboard</li>
            <li class="{{ request()->is('/') ? 'active' : '' }}"><a class="nav-link" href="{{ route('dashboard') }}">
                    <i class="fas fa-fire"></i></i>
                    <span>Dashboard</span></a>
            </li>
            <li class="menu-header">Jadwal</li>
            <li class="{{ request()->is('jadwalguru*') ? 'active' : '' }}"><a class="nav-link"
                    href="{{ route('jadwalguru.index') }}">
                    <i class="fas fa-file"></i></i>
                    <span>Jadwal</span></a>
            </li>
            <li class="menu-header">Absen Daring</li>
            <li class="{{ request()->is('rekapdaring*') ? 'active' : '' }}"><a class="nav-link"
                    href="{{ route('rekapdaring.indexJadwal') }}">
                    <i class="fas fa-file"></i></i>
                    <span>Rekap absen daring</span></a>
            </li>

            @endif
        </ul>
    </aside>
</div>