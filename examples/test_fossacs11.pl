%           Admin_1 = a_1
%           Admin_2 = a_2
%  SuperUser_user_1 = suu_1
% write_perm_user_1 = wpu_1
%     delete_file_1 = df_1
%            user_1 = u_1

?- latexify(((a_1 says (suu_1 -> wpu_1)) and (a_2 says suu_1) and (((a_1 and a_2) says df_1) -> df_1) and (a_1 and a_2 says ((wpu_1 and (u_1 says df_1)) -> df_1)) and (u_1 says df_1)) -> df_1, 'examples/fossacs11_short.tex').
