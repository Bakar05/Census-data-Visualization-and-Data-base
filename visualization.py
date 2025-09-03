import pandas as pd
from sqlalchemy import create_engine
import matplotlib.pyplot as plt
import seaborn as sns

# Database connection
username = 
password = 
host = 
port = 
database_name = 

engine = create_engine(f'mysql+pymysql://{username}:{password}@{host}:{port}/{database_name}')

# Format population for better y values, pos for default format
def format_population(population, pos=None):
    if population >= 1e9:
        return f'{population / 1e9:.1f}B'
    elif population >= 1e6:
        return f'{population / 1e6:.1f}M'
    elif population >= 1e3:
        return f'{population / 1e3:.0f}K'
    else:
        return f'{population:.0f}'

# Function for plotting view no 1
def Long_Format_Population_Data(country_name, upper_limit=None, lower_limit=None):
    if upper_limit is None or lower_limit is None:
        lower_limit = 1960
        upper_limit = 2024

    query = f"""
        SELECT *  FROM Long_Format_Population_Data 
        WHERE Country_Name = '{country_name}' AND year BETWEEN {lower_limit} AND {upper_limit} ;
    """
    df = pd.read_sql_query(query, engine)

    if df.empty:
        print(f"country not found in database: {country_name}")
        return

    plt.figure(figsize=(12, 7))
    population_trend = sns.lineplot(data=df, x="year", y="population", linewidth=3)
    plt.fill_between(df['year'], df['population'], alpha=0.2, color="#2E86AB")

    plt.title(f"Population Trend: {country_name} ({lower_limit}-{upper_limit})", fontsize=16, fontweight='bold', color="#2E86AB")
    plt.xlabel("Year", fontsize=12)
    plt.ylabel("Population", fontsize=12)

    population_trend.yaxis.set_major_formatter(plt.FuncFormatter(format_population))

    plt.grid(True, alpha=0.3)
    plt.xticks(rotation=45)
    plt.tight_layout()

    plt.savefig(f"{country_name}_population_{lower_limit}_{upper_limit}.png")
    plt.show()

# Function for plotting view no 2
def Global_Population_Growth(upper_limit, lower_limit):
    query = f""" 
        SELECT * FROM Global_Population_Growth 
        WHERE year BETWEEN {lower_limit} AND {upper_limit} 
        ORDER BY year ASC; 
    """

    df = pd.read_sql_query(query, engine)

    plt.figure(figsize=(12, 7))
    ax = sns.lineplot(data=df, x="year", y="total_population", linewidth=3, color="#2E86AB")
    plt.fill_between(df['year'], df['total_population'], alpha=0.2, color="#2E86AB")

    plt.title(f"Global Population Growth ({lower_limit}-{upper_limit})", fontsize=16, fontweight='bold')
    plt.xlabel("Year")
    plt.ylabel("Total Population")

    ax.yaxis.set_major_formatter(plt.FuncFormatter(format_population))

    plt.grid(True, alpha=0.3)
    plt.xticks(rotation=45)
    plt.tight_layout()

    plt.savefig(f"global_population_{lower_limit}_{upper_limit}.png")
    plt.show()

# Function for plotting view no 3
def Era_Analysis(country_name):
    query = f"""
        SELECT * 
        FROM Era_Analysis 
        WHERE country_name = '{country_name}';
    """

    df = pd.read_sql_query(query, engine)

    if df.empty:
        print(f"country not found in database: {country_name}")
        return

    # Rename the column
    df_filtered = df.rename(columns={"total_population": "population"})

    # Map the era names
    era_map = {
        'Post-Colonial': 'Post-Colonial',
        'Globalization': 'Globalization',
        'Millennium_and_Financial_Crisis': 'Millennium',
        'SDG_and_digital_transformation_Era': 'SDG',
        'COVID_and_Recovery_Era': 'COVID'
    }
    df_filtered['era'] = df_filtered['era'].map(era_map)

    plt.figure(figsize=(12, 7))
    ax = sns.barplot(data=df_filtered, x="era", y="population", hue="country_name", palette="tab10")

    title = f"Era Population Trend: {country_name}" if country_name else "Global Era Population Trend"
    plt.title(title, fontsize=16, fontweight="bold")
    plt.xlabel("Era", fontsize=12)
    plt.ylabel("Population", fontsize=12)

    ax.yaxis.set_major_formatter(plt.FuncFormatter(format_population))

    plt.xticks(rotation=30, ha="right")
    sns.despine()

    plt.tight_layout()
    plt.savefig(f"{country_name}_era_analysis.png" if country_name else "global_era_analysis.png")
    plt.show()

# Function for plotting view no 4
def Cross_Era_Comparison(countries):
    # Query to filter data for selected countries (parameterized)
    query = """
        SELECT 
            country_name,
            AVG(post_colonial_1960) as post_colonial,
            AVG(globalization_1980) as globalization,
            AVG(millennium_2000) as millennium,
            AVG(sdg_2010) as sdg,
            AVG(covid_2020) as covid
        FROM Cross_Era_Comparison
        WHERE country_name IN %s
        GROUP BY country_name;
    """

    df = pd.read_sql_query(query, engine, params=(tuple(countries),))

    if df.empty:
        print(f"No data found for countries: {', '.join(countries)}")
        return

    df_melted = df.melt( id_vars=['country_name'], value_vars=['post_colonial', 'globalization', 'millennium', 'sdg', 'covid'], var_name='era', value_name='population')

    era_map = {'post_colonial': 'Post-Colonial (1960)', 'globalization': 'Globalization (1980)', 'millennium': 'Millennium (2000)', 'sdg': 'SDG Era (2010)', 'covid': 'COVID Era (2020)' }
    df_melted['era'] = df_melted['era'].map(era_map)

    # Define the order of the eras
    era_order = ['Post-Colonial (1960)', 'Globalization (1980)', 'Millennium (2000)', 'SDG Era (2010)', 'COVID Era (2020)']

    # Plot data
    plt.figure(figsize=(15, 8))
    ax = sns.barplot( data=df_melted, x="era", y="population", hue="country_name", palette="tab10", order=era_order )

    plt.title("Population Comparison Across Eras", fontsize=16, fontweight="bold")
    plt.xlabel("Era", fontsize=12)
    plt.ylabel("Average Population", fontsize=12)
    ax.yaxis.set_major_formatter(plt.FuncFormatter(format_population))
    plt.legend(bbox_to_anchor=(1.05, 1), loc='upper left')
    plt.xticks(rotation=30, ha="right")

    # Save with both country names in filename
    filename = "_vs_".join([c.replace(" ", "_") for c in countries]) + "_comparison.png"
    plt.tight_layout()
    plt.savefig(filename, bbox_inches='tight')
    plt.show()

def main():
    while True:
        print("\n--- Population Data Analysis Menu ---")
        print("1. View Country Population Over Time")
        print("2. View Global Population Growth")
        print("3. View Era Analysis for Countries")
        print("4. Compare two countries population")
        print("5. Exit")

        choice = input("Enter your choice (1-5): ")

        if choice == '1':
            country = input("Enter country name: ").strip().capitalize()
            use_custom_range = input("Do you want to specify year range? (y/n): ").lower()

            if use_custom_range == 'y':
                try:
                    lower = int(input("Enter lower year limit: "))
                    upper = int(input("Enter upper year limit: "))
                    if lower > upper:
                        print("Lower limit cannot be greater than upper limit.")
                        continue
                except ValueError:
                    print("Invalid input. Please enter valid year numbers.")
                    continue
            else:
                lower = 1960
                upper = 2024

            Long_Format_Population_Data(country, upper, lower)

        elif choice == '2':
            use_custom_range = input("Do you want to specify year range? (y/n): ").lower()

            if use_custom_range == 'y':
                try:
                    lower = int(input("Enter lower year limit: "))
                    upper = int(input("Enter upper year limit: "))
                    if lower > upper:
                        print("Lower limit cannot be greater than upper limit.")
                        continue
                except ValueError:
                    print("Invalid input. Please enter valid year numbers.")
                    continue
            else:
                lower = 1960
                upper = 2024

            Global_Population_Growth(upper, lower)

        elif choice == '3':
            country = input("Enter country name: ").strip().capitalize()
            Era_Analysis(country)

        elif choice == '4':
            while True:
                countries = input("Enter two countries to compare (separated by commas): ")
                countries_list = [country.strip().title() for country in countries.split(",")]
                if len(countries_list) != 2:
                    print("Please enter 2 countries to compare.")
                else:
                    Cross_Era_Comparison(countries_list)
                    break

        elif choice == '5':
            print("Exiting program. Goodbye!")
            break

        else:
            print("Invalid choice. Please select an option from 1 to 5.")

if __name__ == "__main__":
    main()
