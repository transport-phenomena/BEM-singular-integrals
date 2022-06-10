program test
   use singInt

   implicit none
   real(8) x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4
   real(8) area,G,Gxx,Gxy,Gxz,Gyy,Gyz,Gzz
   integer isrc

   x1 = 1.0D0
   y1 = 1.0D0
   z1 = 1.0D0

   x2 = 2.0D0
   y2 = 2.0D0
   z2 = 1.0D0

   x3 = 2.0D0
   y3 = 2.0D0
   z3 = 2.0D0

   x4 = 1.0D0
   y4 = 1.0D0
   z4 = 2.0D0

   area = 0.5D0*sqrt(2.0D0)

   do isrc=1,4
      call si_tri_lap(x1,y1,z1,x2,y2,z2,x3,y3,z3,area,G,isrc)
      write(*,'(I0,1X,A,G21.15)') isrc,"G,   tri,  laplace = ",G

      call si_tri_stk(x1,y1,z1,x2,y2,z2,x3,y3,z3,area,Gxx,Gxy,Gxz,Gyy,Gyz,Gzz,isrc)
      write(*,'(I0,1X,A,G21.15)') isrc,"Gxx, tri,  stokes  = ",Gxx
      write(*,'(I0,1X,A,G21.15)') isrc,"Gxy, tri,  stokes  = ",Gxy
      write(*,'(I0,1X,A,G21.15)') isrc,"Gxz, tri,  stokes  = ",Gxz
      write(*,'(I0,1X,A,G21.15)') isrc,"Gyy, tri,  stokes  = ",Gyy
      write(*,'(I0,1X,A,G21.15)') isrc,"Gyz, tri,  stokes  = ",Gyz
      write(*,'(I0,1X,A,G21.15)') isrc,"Gzz, tri,  stokes  = ",Gzz
   end do

   do isrc=1,5
      call si_qua_lap(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4,G,isrc)
      write(*,'(I0,1X,A,G21.15)') isrc,"G,   quad, laplace = ",G

      call si_qua_stk(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4,Gxx,Gxy,Gxz,Gyy,Gyz,Gzz,isrc)
      write(*,'(I0,1X,A,G21.15)') isrc,"Gxx, quad, stokes  = ",Gxx
      write(*,'(I0,1X,A,G21.15)') isrc,"Gxy, quad, stokes  = ",Gxy
      write(*,'(I0,1X,A,G21.15)') isrc,"Gxz, quad, stokes  = ",Gxz
      write(*,'(I0,1X,A,G21.15)') isrc,"Gyy, quad, stokes  = ",Gyy
      write(*,'(I0,1X,A,G21.15)') isrc,"Gyz, quad, stokes  = ",Gyz
      write(*,'(I0,1X,A,G21.15)') isrc,"Gzz, quad, stokes  = ",Gzz      
   end do

end program 

! Results should be:
!1 G,   tri,  laplace = 0.741049176433351E-01
!1 Gxx, tri,  stokes  =  1.33947814991658
!1 Gxy, tri,  stokes  = 0.408248290463863
!1 Gxz, tri,  stokes  = 0.183503419072274
!1 Gyy, tri,  stokes  =  1.33947814991658
!1 Gyz, tri,  stokes  = 0.183503419072274
!1 Gzz, tri,  stokes  =  1.04596313797770
!2 G,   tri,  laplace = 0.117259562474806
!2 Gxx, tri,  stokes  =  1.86707175391020
!2 Gxy, tri,  stokes  = 0.393544633774186
!2 Gxz, tri,  stokes  = -.313562147412361
!2 Gyy, tri,  stokes  =  1.86707175391020
!2 Gyz, tri,  stokes  = -.313562147412361
!2 Gzz, tri,  stokes  =  2.15996497272365
!3 G,   tri,  laplace = 0.912129579777670E-01
!3 Gxx, tri,  stokes  =  1.31107546170702
!3 Gxy, tri,  stokes  = 0.164859626926432
!3 Gxz, tri,  stokes  = 0.298858490722684
!3 Gyy, tri,  stokes  =  1.31107546170702
!3 Gyz, tri,  stokes  = 0.298858490722684
!3 Gzz, tri,  stokes  =  1.96271241570832
!4 G,   tri,  laplace = 0.225824983713228
!4 Gxx, tri,  stokes  =  3.61851037798638
!4 Gxy, tri,  stokes  = 0.780709938664333
!4 Gxz, tri,  stokes  = 0.126780791801957
!4 Gyy, tri,  stokes  =  3.61851037798638
!4 Gyz, tri,  stokes  = 0.126780791801957
!4 Gzz, tri,  stokes  =  4.11418100131543
!1 G,   quad, laplace = 0.165317875621102
!1 Gxx, quad, stokes  =  2.65055361162360
!1 Gxy, quad, stokes  = 0.573107917390295
!1 Gxz, quad, stokes  = 0.482361909794959
!1 Gyy, quad, stokes  =  2.65055361162360
!1 Gyz, quad, stokes  = 0.482361909794959
!1 Gzz, quad, stokes  =  3.00867555368602
!2 G,   quad, laplace = 0.165317875621102
!2 Gxx, quad, stokes  =  2.65055361162360
!2 Gxy, quad, stokes  = 0.573107917390295
!2 Gxz, quad, stokes  = -.482361909794959
!2 Gyy, quad, stokes  =  2.65055361162360
!2 Gyz, quad, stokes  = -.482361909794959
!2 Gzz, quad, stokes  =  3.00867555368601
!3 G,   quad, laplace = 0.165317875621102
!3 Gxx, quad, stokes  =  2.65055361162360
!3 Gxy, quad, stokes  = 0.573107917390295
!3 Gxz, quad, stokes  = 0.482361909794959
!3 Gyy, quad, stokes  =  2.65055361162360
!3 Gyz, quad, stokes  = 0.482361909794959
!3 Gzz, quad, stokes  =  3.00867555368602
!4 G,   quad, laplace = 0.165317875621102
!4 Gxx, quad, stokes  =  2.65055361162360
!4 Gxy, quad, stokes  = 0.573107917390295
!4 Gxz, quad, stokes  = -.482361909794959
!4 Gyy, quad, stokes  =  2.65055361162360
!4 Gyz, quad, stokes  = -.482361909794959
!4 Gzz, quad, stokes  =  3.00867555368601
!5 G,   quad, laplace = 0.330635751242204
!5 Gxx, quad, stokes  =  5.30110722324719
!5 Gxy, quad, stokes  =  1.14621583478059
!5 Gxz, quad, stokes  = -.111022302462516E-15
!5 Gyy, quad, stokes  =  5.30110722324719
!5 Gyz, quad, stokes  = -.111022302462516E-15
!5 Gzz, quad, stokes  =  6.01735110737203