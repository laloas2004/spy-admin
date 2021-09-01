import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MissionsBulkComponent } from './missions-bulk.component';

describe('MissionsBulkComponent', () => {
  let component: MissionsBulkComponent;
  let fixture: ComponentFixture<MissionsBulkComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MissionsBulkComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MissionsBulkComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
