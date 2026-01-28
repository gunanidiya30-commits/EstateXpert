# 3E.4: Flask → R analytics invocation utility

import subprocess
import os

R_SCRIPT_PATH = os.path.join(
    os.path.dirname(__file__),
    "r_analytics.R"
)

def generate_price_trend_chart(locality_id, prices, output_dir):
    """
    Runs R script to generate a price trend PNG.
    Returns output file path or None on failure.
    """
    try:
        output_path = os.path.join(
            output_dir,
            f"locality_{locality_id}_price_trend.png"
        )

        cmd = [
            "Rscript",
            R_SCRIPT_PATH,
            output_path,
            str(prices[0]),
            str(prices[1]),
            str(prices[2]),
        ]

        subprocess.run(cmd, check=True)
        return output_path

    except Exception as e:
        print(f"[R ANALYTICS ERROR]: {e}")
        return None
