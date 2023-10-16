import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ComponenteExtraComponent } from './componente-extra.component';

describe('ComponenteExtraComponent', () => {
  let component: ComponenteExtraComponent;
  let fixture: ComponentFixture<ComponenteExtraComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ComponenteExtraComponent]
    });
    fixture = TestBed.createComponent(ComponenteExtraComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
