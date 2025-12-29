function df=zenodo_df2(x,y)
df=[2*(x-1)+400*x*(x^2-y);
    200*(y-x^2)];