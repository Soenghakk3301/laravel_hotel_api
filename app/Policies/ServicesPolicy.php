<?php

namespace App\Policies;

use App\Models\Services;
use App\Models\User;
use App\Models\UserTypes;
use Illuminate\Auth\Access\HandlesAuthorization;

class ServicesPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function viewAny(User $user)
    {
        
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Services  $services
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function view(User $user, Services $services)
    {
        //
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function create(User $user)
    {
      return in_array($user->user_types_id, [UserTypes::IS_ADMIN, UserTypes::IS_STUFF]);
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Services  $services
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, Services $services)
    {
      return in_array($user->user_types_id, [UserTypes::IS_ADMIN, UserTypes::IS_STUFF]);
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Services  $services
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function delete(User $user, Services $services)
    {
      return in_array($user->user_types_id, [UserTypes::IS_ADMIN, UserTypes::IS_STUFF]);
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Services  $services
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function restore(User $user, Services $services)
    {
        
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\Services  $services
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function forceDelete(User $user, Services $services)
    {
        //
    }
}