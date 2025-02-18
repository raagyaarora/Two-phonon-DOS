c234567
      implicit real *8 (a-h,o-z)
      parameter (nh=501, ha_cmm=219474.6313705D0) !Hartee into cm-1
      parameter (nk=5216,nb=6)
      parameter (alpha=1D0)
      dimension dos(nh,2), dos2(nh,2), odos2(nh,2), fr(nb)
      dimension wt(nk)

      frmax=300.0D0
      frmin= -100.0D0
      df=(frmax-frmin)/dble(nh-1)
      snorm=Sqrt(alpha/3.141592653589793D0)

      do i=1,nh
         dos(i,1)=frmin+df*(i-1)
         dos2(i,1)=frmin+df*(i-1)
         odos2(i,1)=frmin+df*(i-1)
         dos(i,2)=0.D0
         dos2(i,2)=0.D0
         odos2(i,2)=0.D0
      end do

      rewind (8)
      rewind (9)

      read(8,*)
      do ik=1,nk
         read(8,*)
         read(8,*)(fr(ib),ib=1,nb)
         write(6,*)'read 8'
         read(9,*)xx,yy,zz,wt(ik)
         write(6,*)'read 9'
c        do ib=1,nb
c           fr(ib)=fr(ib)*ha_cmm
c        end do
         do ib=1,nb
            fri=fr(ib)
            do ih=1,nh
               ddf=alpha*(fr(ib)-dos(ih,1))**2
               if ( ddf .lt. 40.d0 ) then
                       ddf=exp(-ddf)*snorm
               else 
                       ddf = 0.D0
               end if
               dos(ih,2)=dos(ih,2)+ddf*wt(ik)
            end do
            do jb=1,nb
               do ih=1,nh
               ddf=alpha*(fr(ib)+fr(jb)-dos2(ih,1))**2
               if ( ddf .lt. 40.d0 ) then
                       ddf=exp(-ddf)*snorm
               else 
                       ddf = 0.D0
               end if
               dos2(ih,2)=dos2(ih,2)+ddf*wt(ik)
               if ( ib.eq.jb ) then
                  odos2(ih,2)=odos2(ih,2)+ddf*wt(ik)
               end if
               end do
            end do
         end do
      end do

      rewind(10)
      rewind(11)
      rewind(12)
      do i=1,nh
         write(10,"(2f20.10)")dos(i,1),dos(i,2)
         write(11,"(2f20.10)")dos2(i,1),dos2(i,2)
         write(12,"(2f20.10)")odos2(i,1),odos2(i,2)
      end do
         
      stop
      end
