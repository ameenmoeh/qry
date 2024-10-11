{
    "metadata": {
        "kernelspec": {
            "name": "python3",
            "display_name": "Python 3",
            "language": "python"
        },
        "language_info": {
            "name": "python",
            "version": "3.8.10",
            "mimetype": "text/x-python",
            "codemirror_mode": {
                "name": "ipython",
                "version": 3
            },
            "pygments_lexer": "ipython3",
            "nbconvert_exporter": "python",
            "file_extension": ".py"
        }
    },
    "nbformat_minor": 2,
    "nbformat": 4,
    "cells": [
        {
            "cell_type": "code",
            "source": [
                "import pyodbc\r\n",
                "import pandas as pd\r\n",
                "conn = pyodbc.connect('Driver={SQL Server};'\r\n",
                "'Server=10.1.7.82;'\r\n",
                "'Database=simpeg41;'\r\n",
                "'User Id=sa;'\r\n",
                "'Password=P@ssw0rd1;')\r\n",
                "df = pd.read_sql_query('SELECT * FROM tm_tukin', conn)\r\n",
                "print(df)"
            ],
            "metadata": {
                "azdata_cell_guid": "6277a04a-ead9-4ebc-b1c2-53f5c69208cd",
                "language": "python",
                "tags": []
            },
            "outputs": [
                {
                    "output_type": "error",
                    "ename": "Error",
                    "evalue": "('HY000', '[HY000] [Microsoft][ODBC SQL Server Driver]Cannot generate SSPI context (11001) (SQLDriverConnect); [HY000] [Microsoft][ODBC SQL Server Driver]Invalid connection string attribute (0); [HY000] [Microsoft][ODBC SQL Server Driver]Cannot generate SSPI context (11001); [HY000] [Microsoft][ODBC SQL Server Driver]Invalid connection string attribute (0)')",
                    "traceback": [
                        "\u001b[1;31m---------------------------------------------------------------------------\u001b[0m",
                        "\u001b[1;31mError\u001b[0m                                     Traceback (most recent call last)",
                        "Cell \u001b[1;32mIn[1], line 3\u001b[0m\n\u001b[0;32m      1\u001b[0m \u001b[38;5;28;01mimport\u001b[39;00m \u001b[38;5;21;01mpyodbc\u001b[39;00m\n\u001b[0;32m      2\u001b[0m \u001b[38;5;28;01mimport\u001b[39;00m \u001b[38;5;21;01mpandas\u001b[39;00m \u001b[38;5;28;01mas\u001b[39;00m \u001b[38;5;21;01mpd\u001b[39;00m\n\u001b[1;32m----> 3\u001b[0m conn \u001b[38;5;241m=\u001b[39m \u001b[43mpyodbc\u001b[49m\u001b[38;5;241;43m.\u001b[39;49m\u001b[43mconnect\u001b[49m\u001b[43m(\u001b[49m\u001b[38;5;124;43m'\u001b[39;49m\u001b[38;5;124;43mDriver=\u001b[39;49m\u001b[38;5;124;43m{\u001b[39;49m\u001b[38;5;124;43mSQL Server};\u001b[39;49m\u001b[38;5;124;43m'\u001b[39;49m\n\u001b[0;32m      4\u001b[0m \u001b[38;5;124;43m'\u001b[39;49m\u001b[38;5;124;43mServer=10.1.7.82;\u001b[39;49m\u001b[38;5;124;43m'\u001b[39;49m\n\u001b[0;32m      5\u001b[0m \u001b[38;5;124;43m'\u001b[39;49m\u001b[38;5;124;43mDatabase=simpeg41;\u001b[39;49m\u001b[38;5;124;43m'\u001b[39;49m\n\u001b[0;32m      6\u001b[0m \u001b[38;5;124;43m'\u001b[39;49m\u001b[38;5;124;43mUser Id=sa;\u001b[39;49m\u001b[38;5;124;43m'\u001b[39;49m\n\u001b[0;32m      7\u001b[0m \u001b[38;5;124;43m'\u001b[39;49m\u001b[38;5;124;43mPassword=P@ssw0rd1;\u001b[39;49m\u001b[38;5;124;43m'\u001b[39;49m\u001b[43m)\u001b[49m\n\u001b[0;32m      8\u001b[0m df \u001b[38;5;241m=\u001b[39m pd\u001b[38;5;241m.\u001b[39mread_sql_query(\u001b[38;5;124m'\u001b[39m\u001b[38;5;124mSELECT * FROM tm_tukin\u001b[39m\u001b[38;5;124m'\u001b[39m, conn)\n\u001b[0;32m      9\u001b[0m \u001b[38;5;28mprint\u001b[39m(df)\n",
                        "\u001b[1;31mError\u001b[0m: ('HY000', '[HY000] [Microsoft][ODBC SQL Server Driver]Cannot generate SSPI context (11001) (SQLDriverConnect); [HY000] [Microsoft][ODBC SQL Server Driver]Invalid connection string attribute (0); [HY000] [Microsoft][ODBC SQL Server Driver]Cannot generate SSPI context (11001); [HY000] [Microsoft][ODBC SQL Server Driver]Invalid connection string attribute (0)')"
                    ]
                }
            ],
            "execution_count": 1
        }
    ]
}