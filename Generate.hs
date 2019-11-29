import Control.Monad

ocl_int_types = ocl_sint_types ++ ocl_uint_types
ocl_sint_types = ["char","short","int","long"]
ocl_uint_types = map (\t -> "u" ++ t) ocl_sint_types
ocl_flt_types = ["half","float","double"]
ocl_types = ocl_int_types ++ ocl_flt_types

gen :: IO ()
gen = do
  forM_ ocl_types $ \t ->
    forM_ [1,2,4,8,16] $ \n -> do
      let vld_sfx = if n == 1 then "" else show n
      putStrLn $ "as_" ++ t ++ vld_sfx
