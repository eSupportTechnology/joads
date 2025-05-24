<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CheckAdminPermission
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle($request, \Closure $next, $permission)
{
    $admin = auth('admin')->user();

    // Automatically allow access if superadmin
    if ($admin && $admin->role === 'super_admin') {
        return $next($request);
    }

    // Check if admin has permission by route
    if ($admin && $admin->permissions->pluck('route')->contains($permission)) {
        return $next($request);
    }

    abort(403, 'Unauthorized');
}


}
