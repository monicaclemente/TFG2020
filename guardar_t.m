function [T_nova]=guardar_t(T_anterior,t,p,n1,n2)
    fila_nova = {t,p,n1,n2};
    T_nova = [T_anterior;fila_nova];
end