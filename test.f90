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