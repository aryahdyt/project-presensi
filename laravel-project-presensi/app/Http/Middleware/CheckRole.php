<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class CheckRole
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next, ...$roles)
    {
        // if (in_array($request->user()->role_id, $roles)) {
        //     return $next($request);
        // }

        $roles = array_slice(func_get_args(), 2);

        foreach ($roles as $role) {
            $user = Auth::user()->role_id;
            if ($user == $role) {
                return $next($request);
            }
        }

        return redirect('/erorRole');
    }
}
