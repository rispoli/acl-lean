% Ex2.pl
% (a_1 says (suu_1 -> wpu_1)): administrator 1 says that if user 1 is super user then
%                              she has write permissions
% (a_2 says suu_1): administrator 2 says user 1 is classified as super user
% ((a_1 and a_2) says df_1) -> df_1 : adminstrator 1 and 2 jointly control delete file 1
% ((a_1 and a_2) says ((wpu_1 and (u_1 says df_1)) -> df_1)) : administrator 1 and 2 jointly support that
%                                                              a) user 1 has write permission and
%                                                              b) user 1 has direct permission over delete file 1
% (u_1 says df_1) : user 1 asks to delete file 1

?- prove(((a_1 says (suu_1 -> wpu_1)) and
             (a_2 says suu_1) and
             (((a_1 and a_2) says df_1) -> df_1) and
             ((a_1 and a_2) says ((wpu_1 and (u_1 says df_1)) -> df_1)) and
             (u_1 says df_1)) -> df_1).
