import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class ConstantsService {
  constructor() {}

  loading(visible: boolean) {
    const loading = document.getElementById('loading');
    if (loading) {
      if (visible) {
        loading.classList.remove('hidden');
      } else {
        setTimeout(() => {
          loading.classList.add('hidden');
        }, 300);
      }
    }
  }
}
