/* import {inject} from '@angular/core';
import {
  ActivatedRouteSnapshot,
  RouterStateSnapshot,
  Router,
  CanActivateFn, ActivatedRoute, mapToCanActivate
} from '@angular/router';
import {catchError, of} from 'rxjs';
import { map } from 'rxjs/operators';

import {Constants} from "../../constants";
import { LoginServicesService } from './services/login-services.service';

export const AuthGuard: CanActivateFn = (route: ActivatedRouteSnapshot, state: RouterStateSnapshot) => {
  const loginService = inject(LoginServicesService);
  const router = inject(Router);

  return loginService.().pipe(
    map(loggedIn => loggedIn ? true : router.createUrlTree([router.parseUrl(Constants.LOGIN_ROUTE)], {
      queryParams: { loggedOut: true, origUrl: state.url }
    } )),
    catchError((err) => {
      router.navigate([Constants.LOGIN_ROUTE], {
        queryParams: { loggedOut: true, origUrl: state.url }
      });
      return of(false);
    })
  )
} */